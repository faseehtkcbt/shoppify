import 'package:firebase_auth/firebase_auth.dart';

class LoginDataSources {

  Future <String> loginDataSources(
      { required String email, required String password}) async
  {
    String msg="";
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      ).then((value) => msg="Successfully logged in!! ${value.user!.uid}");
    } catch (e) {
      if (e is FirebaseAuthException) {
        return e.code;
      }
      // print('Failed with error code: ${e.code}');
      else{ // print(e.message);
        return e.toString();}
    }
    return msg;

  }
}