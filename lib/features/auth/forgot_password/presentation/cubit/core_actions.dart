import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';

/// Base class for all forgot password core actions.
sealed class ForgotPasswordCoreActions {}

/// Action for sending a password reset email.
class SendEmailAction implements ForgotPasswordCoreActions {
  final SendEmailRequestEntity model;
  SendEmailAction(this.model);
}

/// Action for resetting the user's password.
class ResetPasswordAction implements ForgotPasswordCoreActions {
  final ResetPasswordRequestEntity model;
  ResetPasswordAction(this.model);
}

/// Action for verifying the password reset code.
class VerifyResetCodeAction implements ForgotPasswordCoreActions {
  final VerifyResetCodeRequestEntity model;
  VerifyResetCodeAction(this.model);
}