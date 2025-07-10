import 'package:fitness/features/auth/forgot_password/data/repositories_impl/reset_password_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/contract/reset_password_contract_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';

@GenerateMocks([ResetPasswordContractDataSource])
import 'reset_password_repo_impl_test.mocks.dart';

void main() {
  late ResetPasswordRepoImpl repository;
  late MockResetPasswordContractDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockResetPasswordContractDataSource();
    repository = ResetPasswordRepoImpl(mockDataSource);

    // ✅ لحل MissingDummyValueError
    provideDummy<Result<ResetPasswordResponseModel>>(
      Success(
        ResetPasswordResponseModel(
          token: 'dummyToken',
          message: 'dummyMessage',
        ),
      ),
    );
  });

  test('returns Success when data source returns valid success response', () async {
    // Arrange
    final requestEntity = ResetPasswordRequestEntity(
      email: 'test@example.com',
      newPassword: 'password123',
    );

    final responseModel = ResetPasswordResponseModel(
      token: 'abc123',
      message: 'Password reset successful',
    );

    when(mockDataSource.resetPassword(any))
        .thenAnswer((_) async => Success(responseModel));

    // Act
    final result = await repository.resetPassword(requestEntity);

    // Assert
    expect(result, isA<Success<ResetPasswordResponseEntity>>());
    final success = result as Success<ResetPasswordResponseEntity>;
    expect(success.data?.token, 'abc123');
    expect(success.data?.message, 'Password reset successful');
  });

  test('returns Error when data source returns success but with null data', () async {
    // Arrange
    final requestEntity = ResetPasswordRequestEntity(
      email: 'test@example.com',
      newPassword: 'password123',
    );

    when(mockDataSource.resetPassword(any))
        .thenAnswer((_) async => Success<ResetPasswordResponseModel>(null));

    // Act
    final result = await repository.resetPassword(requestEntity);

    // Assert
    expect(result, isA<Error<ResetPasswordResponseEntity>>());
    final error = result as Error<ResetPasswordResponseEntity>;
    expect(error.exception.toString(), contains('Null data'));
  });

  test('returns Error when data source returns an error result', () async {
    // Arrange
    final requestEntity = ResetPasswordRequestEntity(
      email: 'test@example.com',
      newPassword: 'password123',
    );

    final exception = Exception("Something went wrong");

    when(mockDataSource.resetPassword(any))
        .thenAnswer((_) async => Error<ResetPasswordResponseModel>(exception));

    // Act
    final result = await repository.resetPassword(requestEntity);

    // Assert
    expect(result, isA<Error<ResetPasswordResponseEntity>>());
    expect((result as Error).exception.toString(), contains("Something went wrong"));
  });
}
