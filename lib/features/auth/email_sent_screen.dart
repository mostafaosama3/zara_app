import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/features/auth/sign_in_screen.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Image.asset(AppIcons.emailSent,width: 100,height: 100,fit: BoxFit.cover,),
                const Gap(28),
                Text(
                  'We Sent you an Email to reset\nyour password.',
                  textAlign: TextAlign.center,
                  style: TextStyles.headline2.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(24),
                SizedBox(
                  width: 140,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {
                      pushReplacement(
                        context,
                        const SignInScreen(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Return to Login',
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}