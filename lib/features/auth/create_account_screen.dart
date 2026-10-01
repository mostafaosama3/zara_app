import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/features/auth/forgot_password_screen.dart';
import 'package:zara_app/features/auth/tell_us_about_yourself_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }

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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  void continueButton() {
    if (formKey.currentState!.validate()) {
      pushTo(
        context,
        const TellUsAboutYourselfScreen(),
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
                  const Gap(30),

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
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Gap(28),

                  CustomTextfield(
                    hintText: 'Firstname',
                    validator: validateName,
                  ),

                  const Gap(16),

                  CustomTextfield(
                    hintText: 'Lastname',
                    validator: validateName,
                  ),

                  const Gap(16),

                  CustomTextfield(
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),

                  const Gap(16),

                  CustomTextfield(
                    hintText: 'Password',
                    obscureText: true,
                    validator: validatePassword,
                  ),

                  const Gap(24),

                  MainButton(
                    title: 'Continue',
                    ontap: continueButton,
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

                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
