import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/login/data/model/login_user_dto.dart';
import 'package:fitness/features/auth/login/data/model/login_user_response.dart';

abstract class LoginRepository{
  Future<Result<LoginResponse>> login(LoginUserRequest parameters);

}