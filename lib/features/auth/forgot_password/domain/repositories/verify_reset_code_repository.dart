import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';

/// Contract for a repository that handles verifying password reset codes.
abstract class VerifyResetCodeRepository {
  /// Attempts to verify the password reset code with the given [request].
  ///
  /// Returns a [Result] containing a [VerifyResetCodeResponseEntity] on success,
  /// or an error on failure.
  Future<Result<VerifyResetCodeResponseEntity>> verifyResetCode(VerifyResetCodeRequestEntity request);
}