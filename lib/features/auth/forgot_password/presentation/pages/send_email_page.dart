import 'package:fitness/core/di/di.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/send_email_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/core_actions.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/forgot_password_state.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/forgot_pssword_cubit.dart';
import 'package:fitness/features/auth/forgot_password/presentation/pages/otp_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/base_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/blur_container.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPage extends StatelessWidget {
  EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.of(context).push(createFadeRoute(const OtpPage()));
          } else if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? "حدث خطأ ما.")),
            );
          }
        },
        child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            final cubit = context.read<ForgotPasswordCubit>();

            return AuthBasePage(
              title: "Enter Your Email",
              subtitle: "Forget password",
              child: Form(
                key: cubit.formKey,
                child: BlurredTextFieldContainer(
                  controller: cubit.emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  bottomText:
                      state.status == Status.loading ? "Loading..." : "Send Email",
                  onTap: state.status == Status.loading
                      ? null
                      : () {
                          if (cubit.formKey.currentState?.validate() ?? false) {
                            final email = cubit.emailController.text.trim();
                            cubit.doIntent(
                              SendEmailAction(
                                SendEmailRequestEntity(email: email),
                              ),
                            );
                          }
                        },
                  hasSecondField: false,
      
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
