import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/send_email_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';

/// Contract for a data source that handles sending password reset emails.
abstract interface class SendEmailContractDataSource {
  /// Attempts to send a password reset email with the given [request].
  ///
  /// Returns a [Result] containing a [SendEmailResponseModel] on success,
  /// or an error on failure.
  Future<Result<SendEmailResponseModel>> sendEmail(SendEmailRequestModel request);
}