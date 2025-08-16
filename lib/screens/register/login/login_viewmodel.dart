import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c15_str/base.dart';
import 'package:todo_c15_str/screens/register/login/connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  Future<void> login(String email, String password) async {
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      connector!.goToHome();
    } on FirebaseAuthException catch (e) {
      connector!.showErrorMessage(message: e.message);
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
  }
}
