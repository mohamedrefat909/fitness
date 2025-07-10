import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/contract/reset_password_contract_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/mappers/forgot_password_mapper.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/reset_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepoImpl implements ResetPasswordRepository {
  final ResetPasswordContractDataSource _remoteDataSource;

  ResetPasswordRepoImpl(this._remoteDataSource);

  @override
  Future<Result<ResetPasswordResponseEntity>> resetPassword(ResetPasswordRequestEntity request) async {
    final requestModel = request.toModel();

    final result = await _remoteDataSource.resetPassword(requestModel);

    if (result is Success<ResetPasswordResponseModel>) {
      final model = result.data;
      if (model == null) return Error(Exception('Null data in success response'));
      return Success(model.toEntity());
    }

    if (result is Error<ResetPasswordResponseModel>) {
      return Error(result.exception);
    }

    return Error(Exception('Unknown result type'));
  }
}
