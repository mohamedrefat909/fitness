import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/reset_password_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case for resetting a user's password.
@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepository _repository;

  ResetPasswordUseCase(this._repository);

  /// Calls the repository to reset the user's password.
  Future<Result<ResetPasswordResponseEntity>> call(ResetPasswordRequestEntity request) async {
    try {
      final result = await _repository.resetPassword(request);
      return result;
    } catch (e) {
      return Error(Exception('Unexpected error caught in UseCase: $e'));
    }
  }

}