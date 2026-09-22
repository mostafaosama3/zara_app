import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/features/auth/create_account_screen.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/core/widgets/social_login_button.dart';
import 'package:zara_app/features/auth/sign_in_password_screen.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                const Gap(50),

                Text(
                  'Sign in',
                  style: TextStyles.title1.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),

                const Gap(28),

                const CustomTextfield(
                  hintText: 'Email Address',
                ),

                const Gap(16),

                MainButton(
  title: 'Continue',
  ontap: () {
    pushTo(
      context,
      const SignInPasswordScreen(),
    );
  },
),
                const Gap(14),

                Row(
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                   GestureDetector(
  onTap: () {
    pushTo(
      context,
      const CreateAccountScreen(),
    );
  },
                      child: Text(
                        'Create One',
                        style: TextStyles.caption2.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(45),

                SocialLoginButton(
                  title: 'Continue With Apple',
                  iconPath: AppIcons.apple,
                  onTap: () {},
                ),

                const Gap(12),

                SocialLoginButton(
                  title: 'Continue With Google',
                  iconPath: AppIcons.google,
                  onTap: () {},
                ),

                const Gap(12),

                SocialLoginButton(
                  title: 'Continue With Facebook',
                  iconPath: AppIcons.facebook,
                  onTap: () {},
                ),

                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}