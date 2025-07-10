import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/send_email_repository.dart';
import 'package:fitness/features/auth/forgot_password/domain/usecases/send_email_use_case.dart';

@GenerateMocks([SendEmailRepository])
import 'send_email_use_case_test.mocks.dart';

void main() {
  late SendEmailUseCase sendEmailUseCase;
  late MockSendEmailRepository mockRepository;

  setUp(() {
    mockRepository = MockSendEmailRepository();
    sendEmailUseCase = SendEmailUseCase(mockRepository);

    provideDummy<Result<SendEmailResponseEntity>>(
      Success(
        SendEmailResponseEntity(
          message: "Email sent successfully",
          info: "success",
        ),
      ),
    );
  });

  test('returns Success when repository sends email successfully', () async {
    // Arrange
    final request = SendEmailRequestEntity(email: "test@example.com");
    final response = SendEmailResponseEntity(
      message: "Email sent successfully",
      info: "success",
    );

    when(mockRepository.sendEmail(request))
        .thenAnswer((_) async => Success(response));

    // Act
    final result = await sendEmailUseCase.call(request);

    // Assert
    expect(result, isA<Success<SendEmailResponseEntity>>());
    expect((result as Success).data.message, "Email sent successfully");
    verify(mockRepository.sendEmail(request)).called(1);
  });


  test('returns Error when repository fails to send email', () async {
    // Arrange
    final request = SendEmailRequestEntity(email: "test@example.com");
    final error = Error<SendEmailResponseEntity>(Exception("Failed to send email"));

    when(mockRepository.sendEmail(request))
        .thenAnswer((_) async => error);

    // Act
    final result = await sendEmailUseCase.call(request);

    // Assert
    expect(result, isA<Error<SendEmailResponseEntity>>());
    verify(mockRepository.sendEmail(request)).called(1);
  });

  test('returns Error when repository throws an exception', () async {
    // Arrange
    final request = SendEmailRequestEntity(email: "test@example.com");

    when(mockRepository.sendEmail(request))
        .thenThrow(Exception("Unexpected error"));

    // Act
    final result = await sendEmailUseCase.call(request);

    // Assert
    expect(result, isA<Error<SendEmailResponseEntity>>());
    verify(mockRepository.sendEmail(request)).called(1);
  });
}
