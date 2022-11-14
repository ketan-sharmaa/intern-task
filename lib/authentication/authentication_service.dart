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
  Future logIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, s) {
      log(e.message!, stackTrace: s, name: 'vbnm', error: '');
    }
  }

  Future signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, s) {
      log(e.message!, stackTrace: s, name: 'vbnm', error: '');
    }
  }

  Future addUserDetails(String fullName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'fullName': fullName,
      'email': email,
    });
  }

  Future passwordReset({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'invalid-email') {
        log(e.message!, stackTrace: s, name: 'vbnm');
      }
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
