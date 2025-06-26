import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/datasources/remote/send_email_remote_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/data/datasources/mappers/forgot_password_mapper.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/send_email_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SendEmailRepository)
class SendEmailRepoImpl implements SendEmailRepository {
  final SendEmailRemoteDataSource _remoteDataSource;

  SendEmailRepoImpl(this._remoteDataSource);

  @override
  Future<Result<SendEmailResponseEntity>> sendEmail(SendEmailRequestEntity request) async {
    final requestModel = request.toModel();

    final result = await _remoteDataSource.sendEmail(requestModel);

    if (result is Success<SendEmailResponseModel>) {
      final model = result.data;
      if (model == null) return Error(Exception('Null data in success response'));
      return Success(model.toEntity());
    }

    if (result is Error<SendEmailResponseModel>) {
      return Error(result.exception);
    }

    return Error(Exception('Unknown result type'));

}
}