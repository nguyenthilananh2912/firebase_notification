import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'hallo.dart';
import 'hello.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  final String? message;

  MyHomePage({Key? key, this.message}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        if (value.data['page'] == "hallo_page") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HalloPage(message: value.data['message'])));
        } else if (value.data['page'] == "hello_page") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HelloPage(message: value.data['message'])));
        }
      }
    });

    FirebaseMessaging.onMessage.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        String ac = jsonEncode(message.data);

        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                priority: Priority.high,
                importance: Importance.max,
                setAsGroupSummary: true,
                styleInformation: const DefaultStyleInformation(true, true),
                largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
                channelShowBadge: true,
                autoCancel: true,
                icon: '@drawable/ic_notifications_icon',
              ),
            ),
            payload: ac);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['page'] == "hallo_page") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HalloPage(message: message.data['message'])));
      } else if (message.data['page'] == "hello_page") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HelloPage(message: message.data['message'])));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'abcccccccc',
            ),
          ],
        ),
      ),
    );
  }
}



