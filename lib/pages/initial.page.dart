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

        if (await userStore.isLoggedIn()) {
          await userStore.getMe();
          navigator.pushReplacementNamed('/finish-registration');
        } else {
          navigator.pushReplacementNamed('/auth');
        }
      });
    }, []);

    return Container(
      child: Text('test'),
    );
  }
}
