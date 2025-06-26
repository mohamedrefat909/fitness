
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';

sealed class ForgotPasswordCoreActions {}

class SendEmailAction implements ForgotPasswordCoreActions {
  SendEmailRequestEntity model;
  SendEmailAction(this.model);
}

class ResetPasswordAction implements ForgotPasswordCoreActions {
  ResetPasswordRequestEntity model;
  ResetPasswordAction(this.model);
}

class VerifyResetCodeAction implements ForgotPasswordCoreActions {
  VerifyResetCodeRequestEntity model;
  VerifyResetCodeAction(this.model);
}