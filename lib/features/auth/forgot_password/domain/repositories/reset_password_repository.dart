import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';

/// Contract for a repository that handles password reset operations.
abstract class ResetPasswordRepository {
  /// Attempts to reset the user's password with the given [request].
  ///
  /// Returns a [Result] containing a [ResetPasswordResponseEntity] on success,
  /// or an error on failure.
  Future<Result<ResetPasswordResponseEntity>> resetPassword(ResetPasswordRequestEntity request);
}