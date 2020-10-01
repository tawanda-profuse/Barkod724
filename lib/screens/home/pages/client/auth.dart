import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<FirebaseUser> googleSignIn();
}

class Auth implements BaseAuth {
  @override
  // ignore: missing_return
  Future<FirebaseUser> googleSignIn() async {
    try {
      //return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
