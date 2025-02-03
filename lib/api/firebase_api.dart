import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.notification?.title}');
  print('Message Body: ${message.notification?.body}');
  print('Message data: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessage = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _firebaseMessage.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    final token = await _firebaseMessage.getToken();
    print('FCM Token: $token');

    // In this method we customize the message or local message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message: ${message.notification?.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Opened app from notification: ${message.notification?.title}");
    });
  }
}
