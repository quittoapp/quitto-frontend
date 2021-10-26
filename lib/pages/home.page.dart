import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:quitto/stores/user.store.dart';
import 'package:quitto/styles/dimensions.dart';
import 'package:quitto/styles/text-styles.dart';

class HomePage extends HookWidget {
  Widget build(BuildContext context) {
    final user = Provider.of<UserStore>(context).user!;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.l,
          vertical: Dimensions.xxl,
        ),
        child: Text('Hi, ${user.fullName}', style: TextStyles.heading),
      ),
    );
  }
}