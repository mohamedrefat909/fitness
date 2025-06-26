import 'package:fitness/core/models/result.dart';
import 'package:fitness/core/utils/shared_prefs_helper.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/response/send_email_response_entity.dart';
import 'package:fitness/features/auth/forgot_password/domain/usecases/reset_password_use_case.dart';
import 'package:fitness/features/auth/forgot_password/domain/usecases/send_email_use_case.dart';
import 'package:fitness/features/auth/forgot_password/domain/usecases/verify_reset_code_use_case.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/core_actions.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final SendEmailUseCase forgotPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyResetCodeUseCase verifyResetUseCase;

  ForgotPasswordCubit({
    required this.forgotPasswordUseCase,
    required this.resetPasswordUseCase,
    required this.verifyResetUseCase,
  }) : super(const ForgotPasswordState(status: Status.initial));

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doIntent(ForgotPasswordCoreActions action) {
    if (action is SendEmailAction) {
      _sendEmail(action);
    } else if (action is VerifyResetCodeAction) {
      _verifyResetCode(action);
    } else if (action is ResetPasswordAction) {
      _resetPassword(action);
    }
  }

  //! Send Reset Code
  Future<void> _sendEmail(SendEmailAction obj) async {
    emit(
      state.copyWith(
        status: Status.loading,
        message: null,
        successType: ForgotPasswordSuccessType.none,
      ),
    );
    final result = await forgotPasswordUseCase.call(obj.model);
    switch (result) {
      case Success<SendEmailResponseEntity> success:
      SharedPrefsHelper.saveEmail(obj.model.email);
        emit(
          state.copyWith(
            status: Status.success,
            message: success.data?.message,
            successType: ForgotPasswordSuccessType.none,
          ),
        );
        break;
      case Error<SendEmailResponseEntity> error:
        emit(
          state.copyWith(
            status: Status.error,
            message: error.exception.toString(),
            successType: ForgotPasswordSuccessType.none,
          ),
        );
        break;
    }
  }

  //! Verify Reset Code
  Future<void> _verifyResetCode(VerifyResetCodeAction obj) async {
    emit(
      state.copyWith(
        status: Status.loading,
        message: null,
        successType: ForgotPasswordSuccessType.none,
      ),
    );
    final result = await verifyResetUseCase.call(obj.model);
    switch (result) {
      case Success success:
        emit(
          state.copyWith(
            status: Status.success,
            message: success.data.message,
            successType: ForgotPasswordSuccessType.verifyCode,
          ),
        );
        break;
      case Error error:
        emit(
          state.copyWith(
            status: Status.error,
            message: error.exception.toString(),
            successType: ForgotPasswordSuccessType.none,
          ),
        );
        break;
    }
  }

  //! Reset Password
  Future<void> _resetPassword(ResetPasswordAction obj) async {
    emit(
      state.copyWith(
        status: Status.loading,
        message: null,
        successType: ForgotPasswordSuccessType.none,
      ),
    );
    final result = await resetPasswordUseCase.call(obj.model);
    switch (result) {
      case Success success:
        emit(
          state.copyWith(
            status: Status.success,
            message: success.data.message,
            successType: ForgotPasswordSuccessType.resetPassword,
          ),
        );
        break;
      case Error error:
        emit(
          state.copyWith(
            status: Status.error,
            message: error.exception.toString(),
            successType: ForgotPasswordSuccessType.none,
          ),
        );
        break;
    }
  }

  //! Resend Code
  Future<void> resendCode() async {
    final email = await SharedPrefsHelper.getEmail();

    if (email == null || email.isEmpty) {
      emit(
        state.copyWith(
          status: Status.error,
          message: "Please enter your email first to resend the code.",
          successType: ForgotPasswordSuccessType.none,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: Status.loading,
        message: null,
        successType: ForgotPasswordSuccessType.none,
      ),
    );

    final result = await forgotPasswordUseCase.call(
      SendEmailRequestEntity(email: email),
    );

    switch (result) {
      case Success<SendEmailResponseEntity> success:
        SharedPrefsHelper.saveEmail(email);
        emit(
          state.copyWith(
            status: Status.success,
            message: "تم إعادة إرسال الكود بنجاح: ${success.data?.message}",
            successType: ForgotPasswordSuccessType.resendCode,
          ),
        );
        break;
      case Error<SendEmailResponseEntity> error:
        emit(
          state.copyWith(
            status: Status.error,
            message: error.exception.toString(),
            successType: ForgotPasswordSuccessType.none,
          ),
        );
        break;
    }
  }
}
