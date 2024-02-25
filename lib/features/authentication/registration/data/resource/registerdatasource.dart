import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import '../modal/registermodel.dart';

class RegisterDataSource {
  Future<String> registerDataSource(RegisterModal register) async {
    String msg = "";


    try {
      String? imageurl;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: register.email.trim(), password: register.pswrd.trim());
      msg = "Registered Successfully";
    } catch (e) {
      if (e is FirebaseAuthException) {
        return e.code;
      } else if (e is FirebaseException) {
        return e.code;
      } else {
        return e.toString();
      }
    }
    return msg;
  }
}

