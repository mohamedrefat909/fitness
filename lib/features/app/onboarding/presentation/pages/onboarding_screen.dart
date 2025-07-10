import 'package:fitness/core/routes_manager/routes_name.dart';
import 'package:fitness/features/app/onboarding/presentation/widgets/custom_move_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../widgets/onboarding_model.dart';
import '../widgets/smooth_custom.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            controller: controller,
            itemCount: OnboardingModel.onboardingList.length,
            itemBuilder: (context, index) {
              final item = OnboardingModel.onboardingList[index];
              final size = OnboardingModel.imageSizes[index];
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      item.image,
                      width: size.width,
                      height: size.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xff4c3c33),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              item.title,
                              style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
                                fontSize: 24,
                                  color: AppColors.backgroundColor
                              )
                            ),
                          ),
                          const SizedBox(height: 20),
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              item.description,
                              style: AppTheme.lightTheme.textTheme.titleSmall?.copyWith(
                                color: AppColors.textField
                              )
                            ),
                          ),
                          const SizedBox(height: 20),
                          SmoothCustom(
                            controller: controller,
                            count: OnboardingModel.onboardingList.length,
                            smoothColors: const Color(0xffff4100),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              if (_currentPage == 0)
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.nextPage(
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 16,
                                      ),
                                    ),
                                    child: Text(
                                      'Next',
                                      style:
                                          AppTheme
                                              .lightTheme
                                              .textTheme
                                              .titleSmall,
                                    ),
                                  ),
                                )
                              else if (_currentPage == OnboardingModel.onboardingList.length - 2)
                                CustomMoveButton(text: 'Next', controller: controller)
                              else
                                CustomMoveButton(text: 'Do It', controller: controller)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}