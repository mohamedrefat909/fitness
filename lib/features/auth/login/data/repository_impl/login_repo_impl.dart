import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/login/data/datasource_contract/login_datasource.dart';
import 'package:fitness/features/auth/login/data/model/login_user_dto.dart';
import 'package:fitness/features/auth/login/data/model/login_user_response.dart';
import 'package:fitness/features/auth/login/domain/repository_contract/login_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});

  @override
  Future<Result<LoginResponse>> login(LoginUserRequest parameters) =>
      loginDataSource.login(parameters);
}
