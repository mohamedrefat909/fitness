import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/verify_reset_code_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';

abstract class VerifyResetCodeContractDataSource {
  Future<Result<VerifyResetCodeResponseModel>> verifyResetCode(VerifyResetCodeRequestModel request);

}