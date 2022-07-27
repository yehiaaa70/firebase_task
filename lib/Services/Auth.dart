import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {

  static Future signUP(email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint("e.toString()");
      debugPrint(e.toString());
      return e.code;
    }
  }
  static Future signIN(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }
  static Future signUPAnonymous() async {
    try {
     await FirebaseAuth.instance
          .signInAnonymously();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

}
