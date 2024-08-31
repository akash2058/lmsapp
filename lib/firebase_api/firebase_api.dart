import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/main.dart';
import 'package:lmsapp/views/notification/lms_notification.dart';

class FirebaseApi {
  final firebasemessaging = FirebaseMessaging.instance;

  Future<void> notification() async {
    await firebasemessaging.requestPermission();
    final token = await firebasemessaging.getToken();

    print('firebasetoken: $token');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMessage(message);
    });

    // Handle messages when the app is opened from a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleMessage(message);
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Check if the app was launched by tapping a notification
    RemoteMessage? initialMessage = await firebasemessaging.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(initialMessage);
    }
  }

  void handleMessage(RemoteMessage message) {
    // Navigate to the notification screen
    navigatorkey.currentState?.push(
      MaterialPageRoute(builder: (context) => const LmsNotifcation()),
    );
  }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background notification logic here if needed
}
