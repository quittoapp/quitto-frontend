import 'package:flutter/material.dart';
import 'package:quitto/models/user.dart';
import 'package:quitto/services/auth.service.dart';
import 'package:quitto/services/user.service.dart';

class UserStore extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> authenticate() async {
    await AuthService.instance.signInWithGoogle();
    await getMe();
  }

  Future<void> getMe() async {
    _user = await UserService.instance.getMe();
  }

  Future<bool> isLoggedIn() {
    return AuthService.instance.isLoggedIn();
  }
}
