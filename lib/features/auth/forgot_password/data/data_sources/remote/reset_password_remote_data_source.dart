import 'package:fitness/core/api_manager/api_execute.dart';
import 'package:fitness/core/api_manager/api_manager.dart';
import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/contract/reset_password_contract_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/reset_password_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';
import 'package:injectable/injectable.dart';

/// Remote data source for handling password reset operations.
@Injectable(as: ResetPasswordContractDataSource)
class ResetPasswordRemoteDataSource implements ResetPasswordContractDataSource {
  final RestClient _client;

  ResetPasswordRemoteDataSource(this._client);

  /// Attempts to reset the user's password using the remote API.
  @override
  Future<Result<ResetPasswordResponseModel>> resetPassword(ResetPasswordRequestModel request) {
    return ApiExecute.executeApi(() async {
      final response = await _client.resetPassword(request);
      return response;
    });
  }
}
