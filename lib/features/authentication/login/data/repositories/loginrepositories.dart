
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/logindatasource.dart';

class LoginRepositories{

  Future<Either<String,String>> loginRepositories( { required String email, required String password}) async{

    try{
      String msg=await LoginDataSources().loginDataSources(email: email, password: password);


      // if(msg.contains("Successfully logined!!")){
      //   var pref= await SharedPreferences.getInstance();
      //   String uid=msg.split(" ").last;
      //   pref.setBool("login", true);
      //   pref.setString("userId", uid);
      //   return const Right("Successfully logined!!");
      // }
      // else if (msg == 'user-not-found') {
      //       msg=("User not found. You can register a new account.");
      //     } else if (msg == 'wrong-password') {
      //       msg=("Wrong password. Please try again.");
      //     } else {
      //       Left(msg);
      //     }

      if(msg.contains("Successfully logged in!!")){
        var pref= await SharedPreferences.getInstance();
        String uid=msg.split(" ").last;
        pref.setBool("login", true);
        pref.setString("userId", uid);
        return const Right("Successfully logged in!!");
      }
      else if (msg == 'user-not-found') {
        return const Left("User not found. You can register a new account.");
      } else if (msg == 'wrong-password') {
        return const Left('Wrong password. Please try again.');
      }
      else if  (msg== 'cancelled') {
        return const Left('The operation was cancelled.');
      } else if (msg == 'permission-denied') {
        return const Left('Insufficient permissions to perform the operation.');
      }
      else{
        return Left("Something Went Wrong!! \nTry Again Later");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}