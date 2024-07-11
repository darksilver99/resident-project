
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> setupInteractedMessage() async {
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    debugPrint("initialMessage");
    _handleMessage(initialMessage);
  }

  // show banner
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  RemoteMessage? notificationData;
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint("onMessage");
    notificationData = message;
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android:
                AndroidNotificationDetails(channel.id, channel.name, channelDescription: channel.description, icon: android.smallIcon, priority: Priority.max, importance: Importance.max),
          ));
    }
  });
  // end show banner

  // tap head up
  var initializationSettingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');

  var initializationSettingsIOS = DarwinInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) {
    debugPrint("onDidReceiveLocalNotification called.");
  });

  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
    debugPrint("on tap noti bar");
    _handleMessage(notificationData!);
  });
  // end tap head up

  // tab task
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  // end tab task
}

void _handleMessage(RemoteMessage message) {
  debugPrint("_handleMessage");
  debugPrint("${message.data}");
  debugPrint("${message.notification!.toMap()}");
  /*FFAppState().update(() {
    FFAppState().notiNavigate = {"nameRouter": message.data['nameRouter'], "corpName": message.data['corpName'], "notification_ref": message.data['notification_ref']};
  });*/
}