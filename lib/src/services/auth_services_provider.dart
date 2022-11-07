import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
import 'package:pekaku_app/src/widget/dialog/toast_allert.dart';
import 'package:provider/provider.dart';

class AuthServicesProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  /// firebase login
  Future<void> authLogin({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  /// firebase register
  Future<void> authRegister({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  /// firebase forgot password
  Future<void> forgotPassword({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  /// login with account google
  Future<void> googleAuthLogin(context) async {
    if (_firebaseAuth.currentUser == null) {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      if (account != null) {
        GoogleSignInAuthentication googleAuth = await account.authentication;
        OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        toastAllert(
          'Berhasil login',
          MyColor.deepAqua,
          2,
        );
        Provider.of<NavigatorProvider>(context, listen: false)
            .navigasiCheckLogin(context);
      }
    }
  }

  /// account loguot
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    GoogleSignIn().signOut();
  }
}
