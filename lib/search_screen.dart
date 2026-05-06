import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'notificationservice/local_notification_service.dart';
import 'widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    return SafeArea(child:
        Scaffold(
          backgroundColor: Colors.black,
          body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
            return Column(
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Column(
                  children:[
                  //SizedBox(height: 10),
                  SearchScreenCustomIcon(Icons.person, 'Profile'),
                  SizedBox(height: 5),
                  SearchScreenSideBar(Icons.settings, 'Settings'),
                  SizedBox(height:MediaQuery.of(context).size.height * 0.07),
                  ]
                  ),

                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("http://13.213.0.96/images/image_1657911808433.png"),
                          ),
                        ),
                      ),
                      Text(
                        'TRUVIU',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.62,
                              height: MediaQuery.of(context).size.height * 0.039,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,

                                  hintText: 'Search',
                                 ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Text('  Search', style: TextStyle(color: Colors.grey, fontSize: 15)),
                      Spacer(),
                      Icon(Icons.mic)
                    ],
                  ),
                ),
                  SizedBox(height: 250),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Trending searches', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      SearchScreenTrendingSearch('Why Samin looks like a pedophile?'),
                      SizedBox(height: 2),
                      SearchScreenTrendingSearch('How to become like Sartaj Mahmud?'),
                      SizedBox(height: 2),
                      SearchScreenTrendingSearch('Why Samin looks like a pedophile?'),
                      SizedBox(height: 2),
                      SearchScreenTrendingSearch('How to become like Sartaj Mahmud?'),SizedBox(height: 2),
                      SearchScreenTrendingSearch('How to become like Sartaj Mahmud?'),SizedBox(height: 2),
                      SearchScreenTrendingSearch('How to become like Sartaj Mahmud?'),SizedBox(height: 2),
                      SearchScreenTrendingSearch('How to become like Sartaj Mahmud?'),SizedBox(height: 2),
                      SearchScreenTrendingSearch('How to become like Sartaj Mahmud?'),SizedBox(height: 2),
                      SearchScreenTrendingSearch('How to become like Sartaj Mahmud?'),
                    ],
                  )
                ],
              );
            }
          ),
          bottomNavigationBar: BottomCustomBar(0),


        ),
      );

  }
}


