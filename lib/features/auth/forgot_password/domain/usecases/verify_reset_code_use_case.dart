import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/verify_reset_code_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeRepository _repository;

  VerifyResetCodeUseCase(this._repository);

  Future<Result<VerifyResetCodeResponseEntity>> call(VerifyResetCodeRequestEntity request) async {
    return await _repository.verifyResetCode(request);
  }
}