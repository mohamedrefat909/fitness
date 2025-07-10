import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';

/// Contract for a repository that handles sending password reset emails.
abstract class SendEmailRepository {
  /// Attempts to send a password reset email with the given [request].
  ///
  /// Returns a [Result] containing a [SendEmailResponseEntity] on success,
  /// or an error on failure.
  Future<Result<SendEmailResponseEntity>> sendEmail(SendEmailRequestEntity request);
}