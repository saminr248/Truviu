import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'Samin/profile_screen.dart';
import 'notificationservice/local_notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
 print(message.data.toString());
 print(message.notification!.title);
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(OverlaySupport.global(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
      routes: {
        "home": (_) => ProfileScreen()
      },
    ),
  ));
}

