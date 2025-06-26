import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/reset_password_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';


abstract class ResetPasswordContractDataSource {
  Future<Result<ResetPasswordResponseModel>> resetPassword(ResetPasswordRequestModel request);
}
