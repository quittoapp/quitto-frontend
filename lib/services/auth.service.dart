import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final instance = new AuthService();

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final result = await googleSignIn.signIn();

    if (result == null) {
      return;
    }

    final authentication = await result.authentication;
    final idToken = authentication.idToken;

    print(idToken);
  }
}
