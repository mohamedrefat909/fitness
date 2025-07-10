import 'dart:async';
import 'package:fitness/features/auth/forgot_password/presentation/widget/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness/core/di/di.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/core_actions.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/forgot_password_state.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/forgot_pssword_cubit.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/base_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/fade_transition.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late ForgotPasswordCubit cubit;
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    cubit = getIt<ForgotPasswordCubit>();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
        setState(() {
          // تحديث الواجهة لإظهار إمكانية إعادة الإرسال
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    cubit.codeController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            if (state.successType == ForgotPasswordSuccessType.verifyCode) {
              Navigator.of(context).push(createFadeRoute(const ResetPasswordPage()));
            } else if (state.successType == ForgotPasswordSuccessType.resendCode) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message ?? "Code resent successfully.")),
              );
            }
          } else if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? "Verification failed.")),
            );
          }
        },
        child: Scaffold(
          body: AuthBasePage(
            title: "Enter Verification Code",
            subtitle: _secondsRemaining > 0
                ? "Resend code in $_secondsRemaining seconds"
                : "You can now resend the code",
            child: Form(
              key: cubit.formKey,
              child: OtpTextFieldContainer(
                controller: cubit.codeController,
                onCompleted: (value) {
                  cubit.codeController.text = value;
                  if (cubit.formKey.currentState?.validate() ?? false) {
                    cubit.doIntent(
                      VerifyResetCodeAction(
                        VerifyResetCodeRequestEntity(resetCode: value),
                      ),
                    );
                  }
                },
                onTapBottom: () {
                  if (cubit.formKey.currentState?.validate() ?? false) {
                    final code = cubit.codeController.text.trim();
                    cubit.doIntent(
                      VerifyResetCodeAction(
                        VerifyResetCodeRequestEntity(resetCode: code),
                      ),
                    );
                  }
                },
                onResendTap: _secondsRemaining == 0
                    ? () {
                  cubit.resendCode();
                  _startTimer();
                }
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
