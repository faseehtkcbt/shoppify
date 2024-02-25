import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api/features/authentication/registration/data/modal/registermodel.dart';

import '../../data/repositories/registerrepositories.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterLoading()) {
    on<CheckRegister>((event, emit) async{
      try{
        emit( RegisterLoading());
        final result=await RegisterRepositories().registerRepositories(event.registerModal);
        String resp="";
        result.fold((l) => resp=l, (r) => resp=r);
        if(result.isRight()){
          emit(RegisterLoaded(resp));
        }
        else{
          emit(RegisterError(resp));
        }
      }
      catch(e)
      {
        throw Exception(e.toString());
      }
      // TODO: implement event handler
    });
  }
}
