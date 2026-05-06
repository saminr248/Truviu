import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'homepage_viewer_test_1.dart';
import 'notificationservice/local_notification_service.dart';
import 'widgets.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  String deviceTokenToSendPushNotification = '';

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'home_screen');
    LocalNotificationService.initialize(context);
    registerNotification();
  }

  void registerNotification() async {
    NotificationSettings settings = await FirebaseMessaging.instance
        .requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message?.notification != null) {
          final routeFromMessage = message?.data["route"];
          Navigator.of(context).pushNamed(routeFromMessage);
          LocalNotificationService.display(message!);
        }
      });

      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
        }
        showSimpleNotification(
            Text(message.notification!.title!,
              style: TextStyle(color: Colors.white),),
            subtitle: Text(message.notification!.body!,
              style: TextStyle(color: Colors.white),),
            leading: Container(
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/truviu_logo_original.png',
                    fit: BoxFit.fill),
              ),
            ),
            duration: Duration(seconds: 2),
            background: Colors.amber
        );
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        if (message.notification != null) {
          final routeFromMessage = message.data["route"];
          Navigator.of(context).pushNamed(routeFromMessage);
          LocalNotificationService.display(message);
        }
      });
    }
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value: $deviceTokenToSendPushNotification");
  }

  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
    return SafeArea(child: Scaffold(
      body: UserViewer(),
      bottomNavigationBar: BottomCustomBar(0),
    ));
  }
}
