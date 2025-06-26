import 'package:fitness/features/auth/forgot_password/data/models/request/send_email_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/reset_password_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/verify_reset_code_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';

import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';


// =================== SEND EMAIL ===================
extension SendEmailRequestMapper on SendEmailRequestEntity {
  SendEmailRequestModel toModel() {
    return SendEmailRequestModel(email: email);
  }
}

extension SendEmailResponseModelMapper on SendEmailResponseModel {
  SendEmailResponseEntity toEntity() {
    return SendEmailResponseEntity(
      message: message,
      info: info,
    );
  }
}

extension SendEmailResponseEntityMapper on SendEmailResponseEntity {
  SendEmailResponseModel toModel() {
    return SendEmailResponseModel(
      message: message,
      info: info,
    );
  }
}

// =================== RESET PASSWORD ===================
extension ResetPasswordRequestMapper on ResetPasswordRequestEntity {
  ResetPasswordRequestModel toModel() {
    return ResetPasswordRequestModel(
      email: email,
      newPassword: newPassword,
    );
  }
}

extension ResetPasswordResponseModelMapper on ResetPasswordResponseModel {
  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(
      message: message,
      token: token,
    );
  }
}

extension ResetPasswordResponseEntityMapper on ResetPasswordResponseEntity {
  ResetPasswordResponseModel toModel() {
    return ResetPasswordResponseModel(
      message: message,
      token: token,
    );
  }
}

// =================== VERIFY RESET CODE ===================
extension VerifyResetCodeRequestMapper on VerifyResetCodeRequestEntity {
  VerifyResetCodeRequestModel toModel() {
    return VerifyResetCodeRequestModel(
   resetCode: resetCode,
    );
  }
}

extension VerifyResetCodeModelMapper on VerifyResetCodeResponseModel {
  VerifyResetCodeResponseEntity toEntity() {
    return VerifyResetCodeResponseEntity(
      status: status,
    );
  }
}

extension VerifyResetCodeEntityMapper on VerifyResetCodeResponseEntity {
  VerifyResetCodeResponseModel toModel() {
    return VerifyResetCodeResponseModel(
      status: status,
    );
  }
}
