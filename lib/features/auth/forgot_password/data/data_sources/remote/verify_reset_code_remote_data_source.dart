import 'package:fitness/core/api_manager/api_execute.dart';
import 'package:fitness/core/api_manager/api_manager.dart';
import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/contract/verify_reset_code_contract_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/verify_reset_code_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';
import 'package:injectable/injectable.dart';

/// Remote data source for verifying password reset codes.
@Injectable(as: VerifyResetCodeContractDataSource)
class VerifyResetCodeRemoteDataSource implements VerifyResetCodeContractDataSource {
  final RestClient _client;

  VerifyResetCodeRemoteDataSource(this._client);

  /// Attempts to verify the password reset code using the remote API.
  @override
  Future<Result<VerifyResetCodeResponseModel>> verifyResetCode(
    VerifyResetCodeRequestModel request,
  ) {
    return ApiExecute.executeApi(() async {
      final response = await _client.verifyCode(request);
      return response;
    });
  }
}