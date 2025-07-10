import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/remote/reset_password_remote_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/reset_password_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';

import 'package:fitness/core/api_manager/api_manager.dart'; // RestClient

@GenerateMocks([RestClient])
import 'reset_password_remote_data_source_test.mocks.dart';

void main() {
  late ResetPasswordRemoteDataSource dataSource;
  late MockRestClient mockRestClient;

  setUp(() {
    mockRestClient = MockRestClient();
    dataSource = ResetPasswordRemoteDataSource(mockRestClient);

    // لحل MissingDummyValueError لو احتجناه
    provideDummy<Result<ResetPasswordResponseModel>>(
      Success(
        ResetPasswordResponseModel(
          message: "Success",
          token: "abc123",
        ),
      ),
    );
  });

  test('returns Success when API returns valid response', () async {
    // Arrange
    final request = ResetPasswordRequestModel(
      email: 'test@example.com',
      newPassword: 'newPass123',
    );

    final responseModel = ResetPasswordResponseModel(
      message: 'Password reset successfully',
      token: 'abc123',
    );

    when(mockRestClient.resetPassword(request))
        .thenAnswer((_) async => responseModel);

    // Act
    final result = await dataSource.resetPassword(request);

    // Assert
    expect(result, isA<Success<ResetPasswordResponseModel>>());
    final success = result as Success<ResetPasswordResponseModel>;
    expect(success.data?.message, 'Password reset successfully');
    expect(success.data?.token, 'abc123');
    verify(mockRestClient.resetPassword(request)).called(1);
  });

  test('returns Error when API throws exception', () async {
    // Arrange
    final request = ResetPasswordRequestModel(
      email: 'test@example.com',
      newPassword: 'newPass123',
    );

    when(mockRestClient.resetPassword(request))
        .thenThrow(Exception("Server error"));

    // Act
    final result = await dataSource.resetPassword(request);

    // Assert
    expect(result, isA<Error<ResetPasswordResponseModel>>());
    expect((result as Error).exception.toString(), contains("Server error"));
    verify(mockRestClient.resetPassword(request)).called(1);
  });
}
