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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  void continueButton() {
    if (formKey.currentState!.validate()) {
      pushTo(
        context,
        const SignInPasswordScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),

            child: Form(
              key: formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(90),

                  Text(
                    'Sign in',
                    style: TextStyles.headline1.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Gap(28),

                  CustomTextfield(
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),

                  const Gap(16),

                  MainButton(
                    title: 'Continue',
                    ontap: continueButton,
                  ),

                  const Gap(14),

                  Row(
                    children: [
                      Text(
                        "Don't have an Account? ",
                        style: TextStyles.caption2.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w400,
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
      ),
    );
  }
}
