import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';

abstract class VerifyResetCodeRepository {
  Future<Result<VerifyResetCodeResponseEntity>> verifyResetCode(VerifyResetCodeRequestEntity request);

}