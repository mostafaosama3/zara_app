import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/features/auth/sign_in_password_screen.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/features/auth/forgot_password_screen.dart';
class SignInPasswordScreen extends StatelessWidget {
  const SignInPasswordScreen({super.key});

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
                  hintText: 'Password',
                  obscureText: true,
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