import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness/core/models/result.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/verify_reset_code_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/repositories/verify_reset_code_repository.dart';
import 'package:fitness/features/auth/forgot_password/domain/usecases/verify_reset_code_use_case.dart';

@GenerateMocks([VerifyResetCodeRepository])
import 'verify_reset_code_use_case_test.mocks.dart';

void main() {
  late VerifyResetCodeUseCase verifyResetCodeUseCase;
  late MockVerifyResetCodeRepository mockRepository;

  setUp(() {
    mockRepository = MockVerifyResetCodeRepository();
    verifyResetCodeUseCase = VerifyResetCodeUseCase(mockRepository);

    // Provide a dummy for Result<VerifyResetCodeResponseEntity>
    provideDummy<Result<VerifyResetCodeResponseEntity>>(
      Success(
        VerifyResetCodeResponseEntity(message: "Code verified"),
      ),
    );
  });

  test('returns Success when repository verifies the code successfully', () async {
    // Arrange
    final request = VerifyResetCodeRequestEntity(resetCode:"123456");
    final response = VerifyResetCodeResponseEntity(message: "Code verified");

    when(mockRepository.verifyResetCode(request))
        .thenAnswer((_) async => Success(response));

    // Act
    final result = await verifyResetCodeUseCase.call(request);

    // Assert
    expect(result, isA<Success<VerifyResetCodeResponseEntity>>());
    expect((result as Success).data.message, "Code verified");
    verify(mockRepository.verifyResetCode(request)).called(1);
  });

  test('returns Error when repository fails to verify code', () async {
    // Arrange
    final request = VerifyResetCodeRequestEntity(resetCode:"123456");
    final error = Error<VerifyResetCodeResponseEntity>(Exception("Invalid code"));

    when(mockRepository.verifyResetCode(request))
        .thenAnswer((_) async => error);

    // Act
    final result = await verifyResetCodeUseCase.call(request);

    // Assert
    expect(result, isA<Error<VerifyResetCodeResponseEntity>>());
    verify(mockRepository.verifyResetCode(request)).called(1);
  });

  test('returns Error when repository throws an exception', () async {
    // Arrange
    final request = VerifyResetCodeRequestEntity(resetCode:"123456");

    when(mockRepository.verifyResetCode(request))
        .thenThrow(Exception("Unexpected server error"));

    // Act
    final result = await verifyResetCodeUseCase.call(request);

    // Assert
    expect(result, isA<Error<VerifyResetCodeResponseEntity>>());
    verify(mockRepository.verifyResetCode(request)).called(1);
  });
}
