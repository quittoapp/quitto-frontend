import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitto/pages/finish-registration.page.dart';
import 'package:quitto/pages/auth.page.dart';
import 'package:quitto/pages/home.page.dart';
import 'package:quitto/pages/initial.page.dart';
import 'package:quitto/services/notification.service.dart';
import 'package:quitto/stores/user.store.dart';
import 'package:quitto/styles/themes/main-theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  NotificationService.instance.requestNotificationsPermission();
  await NotificationService.instance.initializeNotifications();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserStore()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: mainThemeColor,
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          '/initial': (context) => InitialPage(),
          '/auth': (context) => AuthPage(),
          '/finish-registration': (context) => FinishRegistration(),
          '/home': (context) => HomePage(),
        },
        initialRoute: '/initial',
      ),
    );
  }
}
