import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quitto/stores/user.store.dart';
import 'package:quitto/styles/dimensions.dart';

class AuthPage extends HookWidget {
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/logo.svg',
                  width: Dimensions.xxxl),
              SizedBox(height: Dimensions.s),
              Text('Finally quit smoking'),
              SizedBox(height: Dimensions.xl),
              SignInButton(
                Buttons.Google,
                onPressed: () => _signInWithGoogle(userStore, context),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _signInWithGoogle(UserStore userStore, context) async {
    await userStore.authenticate();

    if (userStore.user!.hasFinishedRegistration) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/finish-registration');
    }
  }
}
