import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern_task/screens/main_screen.dart';
import 'package:intern_task/authentication/auth_page.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const BottomNavPageView();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}

class Authentication {
  User? user;
  String? errorMessage;

  Future logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return const Center(child: CircularProgressIndicator());
      //     });
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = result.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getMessageFromErrorCode(e.code))));
    }
  }

  Future signUp(
      {required String email,
      required String password,
      required BuildContext context,
      required String fullName}) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e, s) {
      log(e.message!, stackTrace: s, name: 'exception', error: e.code);
      Navigator.pop(context);

      showDialog(
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(getMessageFromErrorCode(e.code)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'),
                )
              ],
            );
          },
          context: context);
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(getMessageFromErrorCode(e.code))));
    }
    await user!.updateDisplayName(fullName);
  }

  Future addUserName({required String fullName}) async {}

  Future addUserDetails(String fullName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'fullName': fullName,
      'email': email,
    });
  }

  Future addNewCourse({
    required String title,
    required String subtitle,
    required String image,
    required int id,
    hours,
    minutes,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('courses').add({
        'title': title,
        'subtitle': subtitle,
        'duration': {'hours': hours, 'minutes': minutes},
        'image': image,
        'id': id
      });
    } on FirebaseAuthException catch (e) {
      log(e.code);
    }
  }

  Future passwordReset(
      {required String email, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getMessageFromErrorCode(e.code))));
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}

String getMessageFromErrorCode(String code) {
  switch (code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email/password combination.";
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Server error, please try again later.";
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";
    case "weak-password":
      return "Password is Weak";
    default:
      return "Login failed. Please try again.";
  }
}
