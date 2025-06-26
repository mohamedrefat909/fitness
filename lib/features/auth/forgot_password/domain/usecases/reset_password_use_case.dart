import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/reset_password_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<Result<ResetPasswordResponseEntity>> call(ResetPasswordRequestEntity request) async {
    return await _repository.resetPassword(request);
  }
}