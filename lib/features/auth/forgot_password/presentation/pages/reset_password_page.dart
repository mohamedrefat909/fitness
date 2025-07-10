import 'package:fitness/core/di/di.dart';
import 'package:fitness/features/auth/forgot_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/core_actions.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/forgot_password_state.dart';
import 'package:fitness/features/auth/forgot_password/presentation/cubit/forgot_pssword_cubit.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/base_page.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/blur_container.dart';
import 'package:fitness/features/auth/forgot_password/presentation/widget/fade_transition.dart';
import 'package:fitness/features/auth/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value.trim())) {
      return "Enter a valid email";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return "Must contain at least one uppercase letter";
    }
    if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
      return "Must contain at least one number";
    }
    return null;
  }

  void _validateAndSubmit(BuildContext context, ForgotPasswordCubit cubit) {
    if (_formKey.currentState?.validate() ?? false) {
      cubit.doIntent(
        ResetPasswordAction(
          ResetPasswordRequestEntity(
            email: _emailController.text.trim(),
            newPassword: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.of(context).pushReplacement(createFadeRoute( LoginScreen()));
          } else if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message ?? "An error occurred during verification.",
                ),
              ),
            );
          }
        },
        child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            final cubit = context.read<ForgotPasswordCubit>();

            return AuthBasePage(
              title: "Reset Password",
              subtitle: "Enter your email and new password",
              child: Form(
                key: _formKey,
                child: BlurredTextFieldContainer(
                  controller: _emailController,
                  hintText: "Enter your email",
                  prefixIcon: Icons.email,
                  hasSecondField: true,
                  secondHintText: "Enter new password",
                  secondPrefixIcon: Icons.lock_outline,
                  secondController: _passwordController,
              
                  bottomText: state.status == Status.loading ? "Loading..." : "Done",
                  onTap: state.status == Status.loading
                      ? null
                      : () => _validateAndSubmit(context, cubit),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
