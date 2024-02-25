
import 'package:dartz/dartz.dart';

import '../modal/registermodel.dart';
import '../resource/registerdatasource.dart';

class RegisterRepositories{

  Future <Either<String,String>> registerRepositories(RegisterModal modal) async{
    try{
      String msg= await  RegisterDataSource().registerDataSource(modal);
      if(msg=="Registered Successfully"){
        return Right(msg);
      }
      else if (msg == 'weak-password') {
        return const Left('The password provided is too weak.');
      } else if (msg == 'email-already-in-use') {
        return const Left('The account already exists for that email.');
      }
      else if  (msg== 'cancelled') {
        return const Left('The operation was cancelled.');
      } else if (msg == 'permission-denied') {
        return const Left('Insufficient permissions to perform the operation.');
      }
      else{
        return Left("Something Went Wrong!! \nTry Again Later");
      }
    }
    catch(e){
      throw Exception(e.toString());
    }

  }
}