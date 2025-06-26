
import 'dart:developer';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/core/models/user_model.dart';
import 'package:fitness/features/auth/login/data/model/login_user_dto.dart';
import 'package:fitness/features/auth/login/data/model/login_user_response.dart';
import 'package:fitness/features/auth/login/domain/usecases/login_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'login_status.dart';

@injectable
class LoginCubit extends Cubit<LoginCubitState> {
  LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  void login(LoginUserRequest parameters) async {
    emit(LoginLoadingState());
    var response = await loginUseCase.login(parameters);
    
    switch (response) {
      case Success():{
        UserModel.instance.setFromJson(response.data!.toJson());
         emit(LoginSuccessState());
         
      }
       
      

      case Error():
        emit(LoginErrorState(massage: response.exception.toString()));      
    }
  }
}
