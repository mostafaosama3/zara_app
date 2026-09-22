import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/features/auth/create_account_screen.dart';
import 'package:zara_app/features/auth/forgot_password_screen.dart';
import 'package:zara_app/features/auth/tell_us_about_yourself_screen.dart';
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),

                AppBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                const Gap(30),

                Text(
                  'Create Account',
                  style: TextStyles.title1.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),

                const Gap(28),

                const CustomTextfield(
                  hintText: 'Firstname',
                ),

                const Gap(16),

                const CustomTextfield(
                  hintText: 'Lastname',
                ),

                const Gap(16),

                const CustomTextfield(
                  hintText: 'Email Address',
                ),

                const Gap(16),

                const CustomTextfield(
                  hintText: 'Password',
                  obscureText: true,
                ),

                const Gap(24),

               MainButton(
  title: 'Continue',
  ontap: () {
    pushTo(
      context,
      const TellUsAboutYourselfScreen(),
    );
  },
),

                const Gap(14),

               GestureDetector(
  onTap: () {
    pushTo(
      context,
      const ForgotPasswordScreen(),
    );
  },
                  child: Text(
                    'Forgot Password? Reset',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
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