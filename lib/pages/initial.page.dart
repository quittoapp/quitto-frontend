import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:quitto/stores/user.store.dart';

class InitialPage extends HookWidget {
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(Duration(milliseconds: 0)).then((_) async {
        final userStore = Provider.of<UserStore>(context, listen: false);
        final navigator = Navigator.of(context);
        final isUserLoggedIn = await userStore.isLoggedIn();

        if (!isUserLoggedIn) {
          return navigator.pushReplacementNamed('/auth');
        }

        await userStore.getMe();
        final user = userStore.user!;

        if (!user.hasFinishedRegistration) {
          return navigator.pushReplacementNamed('/finish-registration');
        }

        return navigator.pushReplacementNamed('/home');
      });
    }, []);

    return Scaffold(
      body: Text('loading'),
    );
  }
}
