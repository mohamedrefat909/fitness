import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/send_email_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SendEmailUseCase {
  final SendEmailRepository _repository;

  SendEmailUseCase(this._repository);

  Future<Result<SendEmailResponseEntity>> call(SendEmailRequestEntity request) async {

    return await _repository.sendEmail(request);
  }
}