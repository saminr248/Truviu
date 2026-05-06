import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shimmer/shimmer.dart';
import 'package:truviu_bvp/Samin/what_is_truviu.dart';
import 'package:truviu_bvp/admission/models.dart';
import 'package:truviu_bvp/carousel_slider.dart';
import 'package:truviu_bvp/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../admission/uni_admission.dart';
import '../notificationservice/local_notification_service.dart';
import '../widgets.dart';
import 'sample_title_page_2.dart';
import 'sample_title_page_3.dart';
import 'sample_title_page_4.dart';
import 'sample_title_page_5.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PageController _pageController;
  String deviceTokenToSendPushNotification = '';
  final Uri _url = Uri.parse('https://www.youtube.com/c/SaminRahmanBhaiya');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

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
                child: Image.asset('assets/images/splash.png',
                    fit: BoxFit.fill),
              ),
            ),
            duration: Duration(seconds: 5),
            background: Colors.black
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
    return SafeArea(child:
    Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     // Material(
          //     //   color: Colors.transparent,
          //     //   child: InkWell(
          //     //       onTap: () {
          //     //         Navigator.pop(context, 'Samin');
          //     //       },
          //     //       child: Icon(Icons.arrow_back_ios_new)),
          //     // ),
          //     // Text('littolsamin', style: TextStyle(fontWeight: FontWeight.bold)),
          //     // Icon(Icons.share)
          //   ],
          // ),
          Row(
            children: [
              SizedBox(width: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  height: 105,
                  width: 105,
                  child:

                  CachedNetworkImage(
                     placeholder: (context, url) => Shimmer.fromColors(
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(150),
                           child: Container(
                             color: Colors.grey[300],
                             height: 105,
                             width: 105,
                           ),
                         ),
                         baseColor: Colors.grey[300]!,
                         highlightColor: Colors.grey[100]!
                     ),
                      fit: BoxFit.cover,
                      imageUrl: 'http://13.229.103.9:3000/images/image_1660166198984.jpg',
                  ),
                ),
              ),
              SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 17),
                  Text('Samin Rahman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Horrible Cook, Worse CEO.',
                        style: TextStyle(fontSize: 10)),
                      // Icon(Icons.business_center, size: 16, color: Colors.brown)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Opening a Business because I can't get a job",
                          style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  GestureDetector(
                    onTap: _launchUrl,
                    child: Text('www.youtube.com/SaminRahmanBhaiya',
                        style: TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.underline
                        )),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Column(
                        children: [
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 70),
          Center(
            child: CarouselSlider.builder(
              itemCount: movies.length,
              options: CarouselOptions(
                height: 400,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIndex){
                final urlImage = movies[index].imageUrl;
                return buildImage(urlImage, index);
              },
            ),
          ),
          // Row(
          //   children: [
          //     SizedBox(width: 115),
          //     Material(
          //       borderRadius: BorderRadius.circular(20),
          //       elevation: 8,
          //       color: Colors.transparent,
          //       shadowColor: Colors.grey,
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UniAdmission()));
          //         },
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(20),
          //           child: Container(
          // margin: EdgeInsets.all(2),
          // height: 200,
          // width: 170,
          // child: CachedNetworkImage(
          //   placeholder: (context, url) => Shimmer.fromColors(
          //       child: ClipRRect(
          //           borderRadius: BorderRadius.circular(20),
          //           child: Container(
          //             color: Colors.grey[300],
          //             height: 198,
          //             width: 168,
          //           ),
          //       ),
          //       baseColor: Colors.grey[300]!,
          //       highlightColor: Colors.grey[100]!
          //   ),
          //   fit: BoxFit.fill,
          //   imageUrl: 'http://13.229.103.9:3000/images/image_1660162550492.png',
          // ),
          // ),
          //         ),
          //       ),
          //     ),
          //     // SizedBox(width: 3),
          //     // Material(
          //     //   borderRadius: BorderRadius.circular(20),
          //     //   elevation: 8,
          //     //   color: Colors.transparent,
          //     //   shadowColor: Colors.grey,
          //     //   child: InkWell(
          //     //     onTap: () {
          //     //       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle3()));
          //     //     },
          //     //     child: ClipRRect(
          //     //       borderRadius: BorderRadius.circular(20),
          //     //       child: Container(
          //     //         margin: EdgeInsets.all(2),
          //     //         height: 200,
          //     //         width: 170,
          //     //         child: CachedNetworkImage(
          //     //           placeholder: (context, url) => Shimmer.fromColors(
          //     //               child: ClipRRect(
          //     //                 borderRadius: BorderRadius.circular(20),
          //     //                 child: Container(
          //     //                   color: Colors.grey[300],
          //     //                   height: 198,
          //     //                   width: 168,
          //     //                 ),
          //     //               ),
          //     //               baseColor: Colors.grey[300]!,
          //     //               highlightColor: Colors.grey[100]!
          //     //           ),
          //     //           fit: BoxFit.fill,
          //     //           imageUrl: 'http://13.229.103.9:3000/images/image_1660162564412.png',
          //     //         ),
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
          // SizedBox(height: 10),
          // Row(
          //   children: [
          //     SizedBox(width: 115),
          //     Material(
          //       color: Colors.transparent,
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle5()));
          //         },
          //         child: Container(
          //           margin: EdgeInsets.all(2),
          //           height: 211,
          //           width: 170,
          //           decoration: BoxDecoration(
          //            borderRadius: BorderRadius.circular(10),
          //            boxShadow: [
          //                BoxShadow(
          //                 color: Colors.grey.withOpacity(.5),
          //                 spreadRadius: 5,
          //                 blurRadius: 7,
          //                 offset: Offset(0, 3),
          //                  )],
          //           image: DecorationImage(
          //           fit: BoxFit.fill,
          //           image: NetworkImage('http://13.229.103.9:3000/images/image_1660162564412.png'),
          //         ),
          //         ),
          //         ),
          //       ),
          //     ),
          // //     SizedBox(width: 3),
          // //     Column(
          // //       children: [
          // //         Material(
          // //           color: Colors.transparent,
          // //           child: InkWell(
          // //             onTap: () {
          // //               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle3()));
          // //             },
          // //             child: Container(
          // //               margin: EdgeInsets.all(2),
          // //               height: 100,
          // //               width: 170,
          // //               decoration: BoxDecoration(
          // //                 borderRadius: BorderRadius.circular(10),
          // //                 boxShadow: [
          // //                   BoxShadow(
          // //                     color: Colors.grey.withOpacity(.5),
          // //                     spreadRadius: 5,
          // //                     blurRadius: 7,
          // //                     offset: Offset(0, 3),
          // //                   )],
          // //
          // //               image: DecorationImage(
          // //               fit: BoxFit.fill,
          // //               image: NetworkImage('http://13.213.0.96/images/image_1657916762137.jpg'),
          // //             ),
          // //             ),
          // //             ),
          // //           ),
          // //         ),
          // //         SizedBox(height: 8),
          // //         Material(
          // //           color: Colors.transparent,
          // //           child: InkWell(
          // //             onTap: () {
          // //               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle4()));
          // //             },
          // //             child: Container(
          // //               margin: EdgeInsets.all(2),
          // //               height: 100,
          // //               width: 170,
          // //               decoration: BoxDecoration(
          // //               borderRadius: BorderRadius.circular(10),
          // //               boxShadow: [
          // //                 BoxShadow(
          // //                   color: Colors.grey.withOpacity(.5),
          // //                   spreadRadius: 5,
          // //                   blurRadius: 7,
          // //                   offset: Offset(0, 3),
          // //                 )],
          // //               image: DecorationImage(
          // //               fit: BoxFit.fill,
          // //               image: NetworkImage('http://13.213.0.96/images/image_1657916818492.jpg'),
          // //             ),
          // //             ),
          // //             ),
          // //           ),
          // //         ),
          // //       ],
          // //     ),
          //   ],
          // ),
          // SizedBox(height: 10)
        ],
  ),
      bottomNavigationBar: BottomCustomBar(69),
    )
    );
  }
  Widget buildImage(String urlImage, int index) => GestureDetector(
    onTap: () => movies[index].title == 'Pedo Samin' ?
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Truviu(),
      ),
    )
        : Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TestTitle3(),
      ),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(urlImage),
            fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      // color: Colors.grey,
      // child: Image.network(
      //   urlImage,
      //   fit: BoxFit.cover,
      // ),
    ),
  );
}