import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quitto/pages/finish-registration.page.dart';
import 'package:quitto/pages/home.page.dart';
import 'package:quitto/services/notification.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  NotificationService.instance.requestNotificationsPermission();
  await NotificationService.instance.initializeNotifications();
  // print(await getFCMToken());

  // final _googleSignIn = GoogleSignIn();
  // final result = await _googleSignIn.signIn();
  // print(result);
  // print(await result!.authentication.then((value) {
  //   print('ID TOKEN');
  //   var token = value.idToken!;
  //   while (token.length > 0) {
  //     int initLength = (token.length >= 500 ? 500 : token.length);
  //     print(token.substring(0, initLength));
  //     int endLength = token.length;
  //     token = token.substring(initLength, endLength);
  //   }
  // }));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: HomePage(),
      home: FinishRegistration(),
    );
  }
}
