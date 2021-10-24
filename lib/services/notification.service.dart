import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

const channelKey = 'smoking_permissions';
const channelName = 'Smoking permissions';
const channelDescription = 'Notification channel for smoking permissions';

class NotificationService {
  static final instance = new NotificationService();

  Future<void> initializeNotifications() async {
    await Firebase.initializeApp();
    AwesomeNotifications().initialize('resource://drawable/app_icon', [
      NotificationChannel(
        channelKey: channelKey,
        channelName: channelName,
        channelDescription: channelDescription,
        ledColor: Colors.white,
      ),
    ]);

    _wireUpFCMToLocalNotifications();
  }

  Future<String> getFCMToken() async {
    await FirebaseMessaging.instance.requestPermission();
    final token = await FirebaseMessaging.instance.getToken();

    if (token == null) {
      throw Exception('FCM token is null for some reason');
    }

    return token;
  }

  final notificationActionsStream = AwesomeNotifications().actionStream;

  void requestNotificationsPermission() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void _wireUpFCMToLocalNotifications() {
    FirebaseMessaging.onMessage.forEach(_showLocalNotification);
  }

  Future<void> _showLocalNotification(message) async {
    inspect(message.data);
    AwesomeNotifications().createNotificationFromJsonData(message.data);
  }
}
