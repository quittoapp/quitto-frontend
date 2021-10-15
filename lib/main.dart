import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quitto/pages/home.page.dart';
import 'package:quitto/services/notification.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  requestNotificationsPermission();
  await initializeNotifications();
  print(await getFCMToken());

  final _googleSignIn = GoogleSignIn();
  print(await _googleSignIn.signIn());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
