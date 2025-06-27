import 'package:fitness/core/models/result.dart';
import 'package:fitness/core/models/user_model.dart';
import 'package:fitness/features/auth/login/data/model/login_user_dto.dart';
import '../model/login_user_response.dart';

abstract class LoginDataSource{
  Future<Result<LoginResponse>> login(LoginUserRequest parameters);

}