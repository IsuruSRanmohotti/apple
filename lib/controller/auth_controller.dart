import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

import '../utils/custom_dialog.dart';

class AuthController {
  Future<UserCredential?> createUserAccount(
      String email, String password, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          CustomDialog.showCupertinoAlertDialog(context,
              title: 'Something went wrong!',
              subtitle: 'The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          CustomDialog.showCupertinoAlertDialog(context,
              title: 'Something went wrong!',
              subtitle: 'The account already exists for that email.');
        }
      } else if (e.code == 'invalid-email') {
        if (context.mounted) {
          CustomDialog.showCupertinoAlertDialog(context,
              title: 'Something went wrong!',
              subtitle: 'Please Check Your Email');
        }
      }
      return null;
    } catch (e) {
      Logger().f(e);
      return null;
    }
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signinUser(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'user-not-found') {
          CustomDialog.showCupertinoAlertDialog(context,
              title: 'Something went wrong!',
              subtitle: 'No user found for that email.');
          Logger().f('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          CustomDialog.showCupertinoAlertDialog(context,
              title: 'Something went wrong!',
              subtitle: 'Wrong password provided for that user.');
          Logger().f('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      Logger().e(e);
    }
  }
}
