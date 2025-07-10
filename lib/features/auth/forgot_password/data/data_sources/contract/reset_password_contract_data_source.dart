import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/reset_password_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';

/// Contract for a data source that handles password reset operations.
abstract interface class ResetPasswordContractDataSource {
  /// Attempts to reset the user's password with the given [request].
  ///
  /// Returns a [Result] containing a [ResetPasswordResponseModel] on success,
  /// or an error on failure.
  Future<Result<ResetPasswordResponseModel>> resetPassword(ResetPasswordRequestModel request);
}
