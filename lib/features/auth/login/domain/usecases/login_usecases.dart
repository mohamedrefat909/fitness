import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/login/data/model/login_user_dto.dart';
import 'package:fitness/features/auth/login/data/model/login_user_response.dart';
import 'package:fitness/features/auth/login/domain/repository_contract/login_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
  LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});

  Future<Result<LoginResponse>> login(LoginUserRequest parameters) =>
      loginRepository.login(parameters);
}
