import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/core/api_manager/api_manager.dart'; // RestClient
import 'package:fitness/features/auth/forgot_password/data/data_sources/remote/send_email_remote_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/send_email_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';

@GenerateMocks([RestClient])
import 'send_email_remote_data_source_test.mocks.dart';

void main() {
  late SendEmailRemoteDataSource dataSource;
  late MockRestClient mockClient;

  setUp(() {
    mockClient = MockRestClient();
    dataSource = SendEmailRemoteDataSource(mockClient);

    provideDummy<Result<SendEmailResponseModel>>(
      Success(
        SendEmailResponseModel(
          message: 'dummy message',
          info: 'dummy info',
        ),
      ),
    );
  });

  test('returns Success when API returns valid response', () async {
    // Arrange
    final request = SendEmailRequestModel(email: 'test@example.com');

    final responseModel = SendEmailResponseModel(
      message: 'Email sent successfully',
      info: 'reset info',
    );

    when(mockClient.sendEmail(request))
        .thenAnswer((_) async => responseModel);

    // Act
    final result = await dataSource.sendEmail(request);

    // Assert
    expect(result, isA<Success<SendEmailResponseModel>>());
    final success = result as Success<SendEmailResponseModel>;
    expect(success.data?.message, 'Email sent successfully');
    expect(success.data?.info, 'reset info');
    verify(mockClient.sendEmail(request)).called(1);
  });

  test('returns Error when API throws exception', () async {
    // Arrange
    final request = SendEmailRequestModel(email: 'test@example.com');

    when(mockClient.sendEmail(request))
        .thenThrow(Exception('API failure'));

    // Act
    final result = await dataSource.sendEmail(request);

    // Assert
    expect(result, isA<Error<SendEmailResponseModel>>());
    expect((result as Error).exception.toString(), contains('API failure'));
    verify(mockClient.sendEmail(request)).called(1);
  });
}
