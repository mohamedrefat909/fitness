import 'package:fitness/features/auth/forgot_password/data/repositories_impl/send_email_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/data/data_sources/contract/send_email_contract_data_source.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';

@GenerateMocks([SendEmailContractDataSource])
import 'send_email_repo_impl_test.mocks.dart';

void main() {
  late SendEmailRepoImpl repository;
  late MockSendEmailContractDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockSendEmailContractDataSource();
    repository = SendEmailRepoImpl(mockDataSource);

    provideDummy<Result<SendEmailResponseModel>>(
      Success(
        SendEmailResponseModel(
          message: 'dummyMessage',
          info: 'dummyInfo',
        ),
      ),
    );
  });

  test('returns Success when data source returns valid success response', () async {
    // Arrange
    final requestEntity = SendEmailRequestEntity(email: 'test@example.com');

    final responseModel = SendEmailResponseModel(
      message: 'Email sent successfully',
      info: 'info123',
    );

    when(mockDataSource.sendEmail(any))
        .thenAnswer((_) async => Success(responseModel));

    // Act
    final result = await repository.sendEmail(requestEntity);

    // Assert
    expect(result, isA<Success<SendEmailResponseEntity>>());
    final success = result as Success<SendEmailResponseEntity>;
    expect(success.data?.message, 'Email sent successfully');
    expect(success.data?.info, 'info123');
  });

  test('returns Error when data source returns success but with null data', () async {
    // Arrange
    final requestEntity = SendEmailRequestEntity(email: 'test@example.com');

    when(mockDataSource.sendEmail(any))
        .thenAnswer((_) async => Success<SendEmailResponseModel>(null));

    // Act
    final result = await repository.sendEmail(requestEntity);

    // Assert
    expect(result, isA<Error<SendEmailResponseEntity>>());
    expect((result as Error).exception.toString(), contains('Null data'));
  });

  test('returns Error when data source returns an error result', () async {
    // Arrange
    final requestEntity = SendEmailRequestEntity(email: 'test@example.com');

    final exception = Exception('Email failed to send');

    when(mockDataSource.sendEmail(any))
        .thenAnswer((_) async => Error<SendEmailResponseModel>(exception));

    // Act
    final result = await repository.sendEmail(requestEntity);

    // Assert
    expect(result, isA<Error<SendEmailResponseEntity>>());
    expect((result as Error).exception.toString(), contains('Email failed to send'));
  });
}
