import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';

abstract class ResetPasswordRepository {
  Future<Result<ResetPasswordResponseEntity>> resetPassword(ResetPasswordRequestEntity request);

}