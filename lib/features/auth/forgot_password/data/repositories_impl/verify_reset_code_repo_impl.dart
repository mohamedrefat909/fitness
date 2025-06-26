import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/datasources/remote/verify_reset_code_remote_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/data/datasources/mappers/forgot_password_mapper.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/verify_reset_code_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: VerifyResetCodeRepository)
class VerifyResetCodeRepoImpl implements VerifyResetCodeRepository {
  final VerifyResetCodeRemoteDataSource _remoteDataSource;

  VerifyResetCodeRepoImpl(this._remoteDataSource);

  @override
  Future<Result<VerifyResetCodeResponseEntity>> verifyResetCode(VerifyResetCodeRequestEntity request) async {
    final requestModel = request.toModel();

    final result = await _remoteDataSource.verifyResetCode(requestModel);

    if (result is Success<VerifyResetCodeResponseModel>) {
      final model = result.data;
      if (model == null) return Error(Exception('Null data in success response'));
      return Success(model.toEntity());
    }

    if (result is Error<VerifyResetCodeResponseModel>) {
      return Error(result.exception);
    }

    return Error(Exception('Unknown result type'));
  }
}
