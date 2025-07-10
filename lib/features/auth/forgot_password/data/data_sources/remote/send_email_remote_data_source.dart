import 'package:fitness/core/api_manager/api_execute.dart';
import 'package:fitness/core/api_manager/api_manager.dart';
import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/contract/send_email_contract_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/send_email_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';
import 'package:injectable/injectable.dart';

/// Remote data source for sending password reset emails.
@Injectable(as: SendEmailContractDataSource)
class SendEmailRemoteDataSource implements SendEmailContractDataSource {
  final RestClient _client;

  SendEmailRemoteDataSource(this._client);

  /// Attempts to send a password reset email using the remote API.
  @override
  Future<Result<SendEmailResponseModel>> sendEmail(
    SendEmailRequestModel request,
  ) {
    return ApiExecute.executeApi(() async {
      final response = await _client.sendEmail(request);
      return response;
    });
  }
}
