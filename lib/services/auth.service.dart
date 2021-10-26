import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:quitto/api/guest.api.dart';
import 'package:quitto/storage/storage.dart';

class AuthService {
  static final instance = new AuthService();

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final result = await googleSignIn.signIn();

    if (result == null) {
      return;
    }

    final authentication = await result.authentication;
    final idToken = authentication.idToken!;

    final apiAuthResult = await GuestApi.instance.client
        .post('/auth/google', queryParameters: {'idToken': idToken});

    final jwt = apiAuthResult.data;
    await Storage.instance.saveJwt(jwt);
  }

  Future<bool> isLoggedIn() async {
    final jwt = await Storage.instance.getJwt();
    return jwt != null;
  }
}
