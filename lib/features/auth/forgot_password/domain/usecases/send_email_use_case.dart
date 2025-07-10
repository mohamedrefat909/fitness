import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/send_email_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case for sending a password reset email.
@injectable
class SendEmailUseCase {
  final SendEmailRepository _repository;

  SendEmailUseCase(this._repository);

  /// Calls the repository to send a password reset email.
  Future<Result<SendEmailResponseEntity>> call(SendEmailRequestEntity request)async {
    try {
      final result = await _repository.sendEmail(request);
      return result;
    } catch (e) {
      return Error(Exception('Unexpected error caught in UseCase: $e'));
    }
  }
}