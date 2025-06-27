import 'package:fitness/features/app/onboarding/presentation/widgets/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_constants/string_manager.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/routes_manager/routes_name.dart';

class CustomMoveButton extends StatelessWidget {

   CustomMoveButton({super.key,required this.text,required this.controller});

   final PageController controller;
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.previousPage(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
              AppColors.transparent,
              side: BorderSide(
                color: AppColors.primaryColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
            ),
            child: Text(
              'Back',
              style:
              AppTheme
                  .lightTheme
                  .textTheme
                  .titleSmall,
            ),
          ),
          ElevatedButton(
            onPressed: () async{
              if(controller.page == OnboardingModel.onboardingList.length -1){
                final pres = await SharedPreferences.getInstance();
                pres.setBool(StringManager.onboardingKey, true);
                Navigator.pushReplacementNamed(context, RoutesName.login);
              }
              controller.nextPage(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
              AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
            ),
            child: Text(text,
              style:
              AppTheme
                  .lightTheme
                  .textTheme
                  .titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
