import 'package:fitness/features/auth/forgot_password/data/repositories_impl/verify_reset_code_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/contract/verify_reset_code_contract_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';

@GenerateMocks([VerifyResetCodeContractDataSource])
import 'verify_reset_code_repo_impl_test.mocks.dart';

void main() {
  late VerifyResetCodeRepoImpl repository;
  late MockVerifyResetCodeContractDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockVerifyResetCodeContractDataSource();
    repository = VerifyResetCodeRepoImpl(mockDataSource);

    // ✅ حل MissingDummyValueError
    provideDummy<Result<VerifyResetCodeResponseModel>>(
      Success(
        VerifyResetCodeResponseModel(
          message: 'dummy message',
        ),
      ),
    );
  });

  test('returns Success when data source returns valid success response', () async {
    // Arrange
    final requestEntity = VerifyResetCodeRequestEntity(
      resetCode: '123456',

    );

    final responseModel = VerifyResetCodeResponseModel(
      message: 'Code verified',
    );

    when(mockDataSource.verifyResetCode(any))
        .thenAnswer((_) async => Success(responseModel));

    // Act
    final result = await repository.verifyResetCode(requestEntity);

    // Assert
    expect(result, isA<Success<VerifyResetCodeResponseEntity>>());
    final success = result as Success<VerifyResetCodeResponseEntity>;
    expect(success.data?.message, 'Code verified');
  });

  test('returns Error when data source returns success with null data', () async {
    // Arrange
    final requestEntity = VerifyResetCodeRequestEntity(
      resetCode: '123456',

    );

    when(mockDataSource.verifyResetCode(any))
        .thenAnswer((_) async => Success<VerifyResetCodeResponseModel>(null));

    // Act
    final result = await repository.verifyResetCode(requestEntity);

    // Assert
    expect(result, isA<Error<VerifyResetCodeResponseEntity>>());
    expect((result as Error).exception.toString(), contains('Null data'));
  });

  test('returns Error when data source returns error result', () async {
    // Arrange
    final requestEntity = VerifyResetCodeRequestEntity(
      resetCode: '123456',
    );

    final exception = Exception('Invalid code');

    when(mockDataSource.verifyResetCode(any))
        .thenAnswer((_) async => Error<VerifyResetCodeResponseModel>(exception));

    // Act
    final result = await repository.verifyResetCode(requestEntity);

    // Assert
    expect(result, isA<Error<VerifyResetCodeResponseEntity>>());
    expect((result as Error).exception.toString(), contains('Invalid code'));
  });
}
