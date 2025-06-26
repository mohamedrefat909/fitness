import 'dart:developer';
import 'dart:ui';

import 'package:fitness/core/app_colors/colors.dart';
import 'package:fitness/core/app_constants/app_validators.dart';
import 'package:fitness/core/models/result.dart';
import 'package:fitness/core/routes_manager/routes_name.dart';
import 'package:fitness/core/widgets/background_pic.dart';
import 'package:fitness/di/injection.dart';
import 'package:fitness/features/auth/login/data/model/login_user_response.dart';
import 'package:fitness/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:fitness/features/auth/login/presentation/cubit/login_status.dart';
//import 'package:fitness/features/login/presentation/widgets/build_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool passwordOff=true;
  LoginCubit loginCubit = getIt.get<LoginCubit>();
  @override
  Widget build(context) {
    return BackgroundPic(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: BlocProvider(
            create: (context) => loginCubit,
            child: BlocConsumer<LoginCubit, LoginCubitState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(RoutesName.home);
                }
                if (state is LoginErrorState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.massage),backgroundColor: AppColors.primaryColor,));
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is LoginLoadingState,
                  blur: 0.01,
                  color: AppColors.gray,
                  progressIndicator: const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/fitlogo.png',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        MediaQuery.of(context).viewInsets.bottom == 0
                            ? const SizedBox(height: 77.5)
                            : const SizedBox.shrink(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              bottom: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hey There',
                                  style: GoogleFonts.balooThambi2(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: AppColors.backgroundColor,
                                  ),
                                ),
                                Text(
                                  'Welcome Back',
                                  style: GoogleFonts.balooThambi2(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    color: AppColors.backgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 34.6,
                              sigmaY: 34.6,
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.transparent),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Login',
                                      style: GoogleFonts.balooThambi2(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24,
                                        color: AppColors.backgroundColor,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Form(
                                      key: formState,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            validator:
                                                AppValidators.validateEmail,

                                            autovalidateMode:
                                                AutovalidateMode
                                                    .onUserInteraction,
                                            controller: emailController,
                                            cursorColor:
                                                AppColors.hintTextColor,
                                            cursorHeight: 20,
                                            style: GoogleFonts.balooThambi2(
                                              color: AppColors.hintTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                            decoration: InputDecoration(
                                              errorBorder: OutlineInputBorder(),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                              ),
                                              label: Text('Email'),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            obscureText: passwordOff,
                                            autovalidateMode:
                                                AutovalidateMode
                                                    .onUserInteraction,
                                            validator:
                                                AppValidators.validatePassword,
                                            cursorColor:
                                                AppColors.hintTextColor,
                                            cursorHeight: 20,
                                            style: GoogleFonts.balooThambi2(
                                              color: AppColors.hintTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                            controller: passwordController,
                                            decoration: InputDecoration(
                      
                                              errorBorder: OutlineInputBorder(),
                                              label: Text('Password'),
                                              prefixIcon: Icon(
                                                Icons.lock_outline,
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    passwordOff=!passwordOff;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.remove_red_eye_outlined,
                                                ),
                                              ),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),

                                          Align(
                                            alignment: Alignment.topRight,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Forget Password?',
                                                style: GoogleFonts.balooThambi2(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: AppColors.primaryColor,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (formState.currentState!
                                                    .validate()) {
                                                      ScaffoldMessenger.of(context).clearSnackBars();
                                                  loginCubit.login(
                                                    LoginUserRequest(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                    ),
                                                  );
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                foregroundColor:
                                                    AppColors.backgroundColor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8,
                                                    ),
                                                child: Text('Login'),
                                              ),
                                            ),
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Dont have an account yet ? ',
                                                style: GoogleFonts.balooThambi2(
                                                  color:
                                                      AppColors.backgroundColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Register',
                                                  style:
                                                      GoogleFonts.balooThambi2(
                                                        color:
                                                            AppColors
                                                                .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor:
                                                            AppColors
                                                                .primaryColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
