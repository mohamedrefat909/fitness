import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/core/api_manager/api_manager.dart'; // RestClient
import 'package:fitness/features/auth/forgot_password/data/data_sources/remote/verify_reset_code_remote_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/verify_reset_code_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';

@GenerateMocks([RestClient])
import 'verify_reset_code_remote_data_source_test.mocks.dart';

void main() {
  late VerifyResetCodeRemoteDataSource dataSource;
  late MockRestClient mockClient;

  setUp(() {
    mockClient = MockRestClient();
    dataSource = VerifyResetCodeRemoteDataSource(mockClient);

    provideDummy<Result<VerifyResetCodeResponseModel>>(
      Success(
        VerifyResetCodeResponseModel(message: 'dummy', ),
      ),
    );
  });

  test('returns Success when API returns valid response', () async {
    // Arrange
    final request = VerifyResetCodeRequestModel(resetCode: '123456');

    final responseModel = VerifyResetCodeResponseModel(
      message: 'Code verified',
    );

    when(mockClient.verifyCode(request)).thenAnswer((_) async => responseModel);

    // Act
    final result = await dataSource.verifyResetCode(request);

    // Assert
    expect(result, isA<Success<VerifyResetCodeResponseModel>>());
    final success = result as Success<VerifyResetCodeResponseModel>;
    expect(success.data?.message, 'Code verified');
    verify(mockClient.verifyCode(request)).called(1);
  });

  test('returns Error when API throws exception', () async {
    // Arrange
    final request = VerifyResetCodeRequestModel(resetCode: '123456');

    when(mockClient.verifyCode(request)).thenThrow(Exception('Invalid code'));

    // Act
    final result = await dataSource.verifyResetCode(request);

    // Assert
    expect(result, isA<Error<VerifyResetCodeResponseModel>>());
    expect((result as Error).exception.toString(), contains('Invalid code'));
    verify(mockClient.verifyCode(request)).called(1);
  });
}
