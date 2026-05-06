# Truviu — A College Startup Post-Mortem

- **Product**: TikTok-style educational video app for international students
- **Scale**: 50,000 users, grown organically through Facebook
- **Stack**: Flutter + Firebase (messaging, analytics) + AWS EC2 (ap-southeast-1)
- **Cost**: $5,000 in AWS credits burned in 5 months
- **My role**: Product — I did not write any of the code

This repository contains the full Flutter client, published as-is. It serves as a record of the engineering and infrastructure decisions that shaped the product, what went wrong, and what the correct decisions would have been.

---

## Summary of Issues

| # | Issue | Severity | Impact |
|---|-------|----------|--------|
| 1 | Firebase credentials committed to version control | Critical | Full Firebase project compromise for anyone who clones the repo |
| 2 | Hardcoded EC2 IP addresses across 57 files | Critical | Single server restart bricks the app; no path to horizontal scaling |
| 3 | All network traffic over plain HTTP | Critical | Zero transport encryption; required disabling iOS App Transport Security |
| 4 | No backend API — static file server only | High | Content changes required app store redeployment |
| 5 | Wrong EC2 instance type, no CDN, no caching, no auto-scaling | High | $5k burn, user-facing buffering, no capacity elasticity |
| 6 | Pervasive code duplication | Medium | ~9,500 lines of code with an estimated ~3,000 lines of unique logic |
| 7 | Temporary Facebook CDN URLs used as permanent asset sources | Medium | Silent image breakage as URLs expired |
| 8 | Async network calls inside Flutter's `build()` method | Medium | Firebase token fetch triggered on every UI frame rebuild |
| 9 | No state management | Medium | All application state lost on navigation; no cross-screen data sharing |
| 10 | No test coverage | Medium | Zero tests for a production app serving 50,000 users |

---

## Context

Truviu was a short-form video app — a "survival guide for studying abroad" targeting Bangladeshi students heading to universities in the US, Canada, Japan, Hong Kong, and Australia. The content covered university admissions, immigration paperwork (I-94, visa documents), credit cards, banking, SIM cards, health insurance, dorm furnishing, SAT preparation, and letters of recommendation. This information is difficult to find in one place and is typically passed down informally by upperclassmen.

The app was built with Flutter, used Firebase Cloud Messaging for push notifications and Firebase Analytics for event tracking, and served all video and image content from bare EC2 instances in AWS ap-southeast-1 (Singapore). Growth was entirely organic through Facebook — no paid acquisition.

---

## Issue Detail

### 1. Firebase Credentials Committed to Version Control

`android/app/google-services.json` contains the Firebase API key, OAuth client ID, and project number in plaintext, checked into git:

- API key: `AIzaSyD-hzPjcBQ2XsPm4xXkuRUAuKEewVkVS3U`
- OAuth client ID: `343421200668-r60jhmats98i7g04svrtb0sptbia9eqb.apps.googleusercontent.com`
- Project number: `343421200668`

The `.gitignore` does not exclude this file. Anyone with access to the repository has full credentials to the Firebase project.

**Correct potential approach**: Add `google-services.json` to `.gitignore` before the initial commit. Store credentials in environment variables or a secrets manager. Rotate keys immediately upon discovering exposure.

---

### 2. Hardcoded EC2 IP Addresses

Two bare EC2 IP addresses appear across **57 source files** with **156 total occurrences**:

- `http://13.213.0.96` — older instance
- `http://13.229.103.9:3000` — newer instance running Express on port 3000

No domain name was ever registered. No DNS layer exists between the client and the infrastructure. If either EC2 instance is terminated or reassigned a new IP, the app is non-functional and the only remediation is shipping a new client binary through app store review — a process measured in days.

This also made horizontal scaling impossible. A second server would have required a client update to add its IP.

**Correct potential approach**: Multiple viable alternatives existed. At minimum, register a domain and configure DNS via Route 53 so the client references a domain rather than an IP — this alone decouples the client from the infrastructure and enables instance replacement without app updates. Beyond that, place an Application Load Balancer (ALB) in front of the instances to enable horizontal scaling and health-check-based failover. Ideally, move to a serverless architecture entirely — the workload (serving static media) does not require persistent compute, and a combination of S3 for storage with CloudFront for delivery eliminates the need for EC2 instances in the serving path altogether.

---

### 3. All Traffic Over Plain HTTP

Every URL in the codebase — all 156 references to the EC2 servers — uses `http://`. No TLS. All video and image content transmitted without encryption.

iOS blocks insecure HTTP by default via App Transport Security (ATS). To ship the app, ATS was explicitly disabled — meaning the team opted out of platform security rather than configuring HTTPS.

**Correct potential approach**: Obtain a TLS certificate (free via Let's Encrypt), configure HTTPS on the server, and update all URLs. This is a one-time setup measured in hours.

---

### 4. No Backend API

The EC2 instances serve static files from a directory (`/images/image_165...jpg`, `/videos/video_165...mp4`). There is no database, no API layer, no user authentication, no content management system.

All content structure — which videos exist, their ordering, categories, and metadata — is hardcoded in the Flutter client. Every content update required a full app release cycle. For 50,000 users, this created a hard bottleneck on iteration speed: content could not be added, removed, or reordered without a new binary passing through app store review.

**Correct potential approach**: At minimum, a JSON manifest file hosted externally (even a static file on S3) that the client fetches at launch. This decouples content from the client binary. A lightweight API with a CMS would have been ideal but was not strictly necessary for an MVP.

---

### 5. Wrong EC2 Instance Type, No CDN, No Caching, No Auto-Scaling

This is the primary driver of the $5,000 AWS spend.

The architecture was a single EC2 compute instance serving video files directly to 50,000 users. The problems compounded:

**Wrong instance type.** We chose a high-memory, high-compute EC2 instance. The workload was I/O- and bandwidth-bound (serving static media files) — it did not need significant CPU or memory. We were paying for compute capacity the workload never used while being constrained by the network throughput that the instance class did not prioritize.

**No CDN.** Every video request was served from a single point of presence in Singapore. Users in Bangladesh, the United States, and Canada all experienced latency proportional to their distance from ap-southeast-1. Users reported buffering. This was the reason.

**No caching.** Zero cache headers on any response. Every repeat view of a video triggered a full re-download from the origin server. The client-side `CachedNetworkImage` library handled image caching, but video — the largest and most frequently accessed content type — had no caching at any layer.

**No auto-scaling.** A single EC2 instance with no scaling group, no load balancer, no capacity elasticity. Traffic spikes hit a fixed ceiling.

**Correct potential approach**: At the most conservative end, right-sizing to a network-optimized instance type and adding an Auto Scaling Group behind an ALB would have reduced cost and provided capacity elasticity. The better architecture: move static media to S3 and front it with CloudFront for edge caching at 400+ global locations with significantly lower data transfer rates. If the application required dynamic compute (e.g., transcoding or an API layer), ECS on Fargate behind an ALB would provide serverless container hosting that scales to zero when idle — eliminating the cost of an always-on instance entirely.

---

### 6. Pervasive Code Duplication

The codebase was built primarily through copy-paste rather than abstraction:

- The push notification registration logic (`registerNotification()` and `getDeviceTokenToSendNotification()`) is duplicated identically across multiple screen files.
- Four separate video player implementations exist: `video_player/`, `video_player_final/`, and individual `video_player_*.dart` files throughout the directory tree — each a slightly modified copy of the same component.
- Two model classes (`Movie` in `admission/models.dart` and `TruviuData` in `Samin/what_is_truviu.dart`) are structurally identical with different names.
- Files with `_test_1`, `_test_2`, `_test_3` suffixes throughout — experimental iterations that all shipped together in the production build.

The codebase is ~9,500 lines of Dart. Estimated unique logic: ~3,000 lines.

---

### 7. Temporary Facebook CDN URLs as Permanent Asset Sources

12+ source files reference `scontent.xx.fbcdn.net` URLs for profile images and thumbnails. These are ephemeral CDN links generated by Facebook's content delivery system. They expire within weeks.

Once expired, the app renders empty containers where images should appear. No fallback images, no error handling, no retry logic.

**Correct potential approach**: Download the assets, host them on infrastructure under our control (S3 or the existing EC2 instance), and reference stable URLs.

---

### 8. Async Calls Inside `build()`

In `profile_screen.dart` (line 107) and `search_screen.dart` (line 90), `getDeviceTokenToSendNotification()` is invoked inside the `build()` method. In Flutter, `build()` is called on every frame rebuild — potentially dozens of times per second during scrolling or animations.

Each invocation fires an async Firebase token request. This should be a one-time call in `initState()`.

**Consequence**: Unnecessary network overhead on every UI interaction, contributing to sluggish performance that is difficult to trace without profiling.

---

### 9. No State Management

No state management solution was used — no Provider, Bloc, Riverpod, or equivalent. All state is local to individual widgets via `setState()`.

Observable consequence: the follower count on the profile page is stored as a widget field initialized to `844`. Tapping "Follow" increments it locally. Navigating away and returning resets it to `844`. There is no persistence, no shared state between screens, and no way to cache data across navigation events.

---

### 10. No Test Coverage

The only test file is the auto-generated `test/widget_test.dart` from `flutter create`. No tests were written. The `build()` performance issue (item 8) is the type of defect that a basic widget test would surface.

---

## What Worked

- **Shipped to 50,000 users.** The majority of college-built software never reaches production. This product achieved real distribution and real usage.
- **Organic Facebook distribution.** No paid acquisition. Growth was driven by content that users found genuinely useful and shared within student communities.
- **The video player component.** Custom progress bar, swipe-based navigation, visibility-detection-based auto-play/pause, looping. This was well-engineered and functional.
- **The content itself.** Immigration logistics, banking guidance, credit card comparisons — information international students need and cannot easily find consolidated in one place.
- **Firebase Analytics and Push Notifications.** Real growth infrastructure was in place — event tracking for product decisions and push notifications for re-engagement.
- **Client-side polish.** `CachedNetworkImage` with shimmer loading placeholders gave the app a responsive feel despite the backend limitations.

---

*The code in this repository is preserved as-is. The decisions documented here are the point.*
