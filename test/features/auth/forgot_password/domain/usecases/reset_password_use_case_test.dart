import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/reset_password_repository.dart';
import 'package:fitness/features/auth/forgot_password/domain/usecases/reset_password_use_case.dart';

import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([ResetPasswordRepository])
void main() {
  late ResetPasswordUseCase resetPasswordUseCase;
  late MockResetPasswordRepository mockRepository;

  setUp(() {
    mockRepository = MockResetPasswordRepository();
    resetPasswordUseCase = ResetPasswordUseCase(mockRepository);
  });

  test(
      'returns Success when repository resets password successfully', () async {
    // Arrange
    final request = ResetPasswordRequestEntity(
        email: "email", newPassword: "newPassword");
    final response = ResetPasswordResponseEntity(
        message: "Password reset successful", token: "token");

    provideDummy<Result<ResetPasswordResponseEntity>>(
      Success(
        ResetPasswordResponseEntity(
          token: "dummyToken",
          message: "dummy message",
        ),
      ),
    );

    when(mockRepository.resetPassword(request))
        .thenAnswer((_) async =>
        Success<ResetPasswordResponseEntity>(response));

    // Act
    final result = await resetPasswordUseCase.call(request);

    // Assert
    expect(result, isA<Success<ResetPasswordResponseEntity>>());
    expect((result as Success).data.message, "Password reset successful");
    verify(mockRepository.resetPassword(request)).called(1);
  });

  test('returns Error when repository fails with an error result', () async {
    // Arrange
    final request = ResetPasswordRequestEntity(
        email: "email", newPassword: "newPassword");
    final error = Error<ResetPasswordResponseEntity>(Exception("Dummy error"));

    // Dummy value for Result<ResetPasswordResponseEntity>
    provideDummy<Result<ResetPasswordResponseEntity>>(
      Error(
        Exception('Dummy exception'),
      ),
    );

    when(mockRepository.resetPassword(request))
        .thenAnswer((_) async => error);

    // Act
    final result = await resetPasswordUseCase.call(request);

    // Assert
    expect(result, isA<Error<ResetPasswordResponseEntity>>());
    verify(mockRepository.resetPassword(request)).called(1);
  });

  test('returns Error when repository throws an exception', () async {
    // Arrange
    final request = ResetPasswordRequestEntity(
        email: "email", newPassword: "newPassword");

    when(mockRepository.resetPassword(request))
        .thenAnswer((_) async => throw Exception("Unexpected error"));

    // Act
    final result = await resetPasswordUseCase.call(request);

    // Assert
    expect(result, isA<Error<ResetPasswordResponseEntity>>());
    verify(mockRepository.resetPassword(request)).called(1);
  });
}
