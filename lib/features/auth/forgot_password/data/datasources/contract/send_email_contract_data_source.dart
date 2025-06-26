import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/send_email_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';

abstract class SendEmailContractDataSource {
  Future<Result<SendEmailResponseModel>> sendEmail(SendEmailRequestModel request);

}