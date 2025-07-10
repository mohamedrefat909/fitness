import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/verify_reset_code_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';

/// Contract for a data source that handles verifying password reset codes.
abstract interface class VerifyResetCodeContractDataSource {
  /// Attempts to verify the password reset code with the given [request].
  ///
  /// Returns a [Result] containing a [VerifyResetCodeResponseModel] on success,
  /// or an error on failure.
  Future<Result<VerifyResetCodeResponseModel>> verifyResetCode(VerifyResetCodeRequestModel request);
}