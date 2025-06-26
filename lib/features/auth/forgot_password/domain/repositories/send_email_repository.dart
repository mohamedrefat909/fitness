import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';

abstract class SendEmailRepository {
  Future<Result<SendEmailResponseEntity>> sendEmail(SendEmailRequestEntity request);

}