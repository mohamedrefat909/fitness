import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/verify_reset_code_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case for verifying a password reset code.
@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeRepository _repository;

  VerifyResetCodeUseCase(this._repository);

  /// Calls the repository to verify the password reset code.
  Future<Result<VerifyResetCodeResponseEntity>> call(VerifyResetCodeRequestEntity request) async{
    try {
      final result = await _repository.verifyResetCode(request);
      return result;
    } catch (e) {
      return Error(Exception('Unexpected error caught in UseCase: $e'));
    }
  }
}