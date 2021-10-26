import 'dart:developer';

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
                onPressed: () => _signInWithGoogle(context),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _signInWithGoogle(context) async {
    await Provider.of<UserStore>(context, listen: false).authenticate();
    Navigator.of(context).pushReplacementNamed('/finish-registration');
  }
}
