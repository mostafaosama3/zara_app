import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/features/Main/main_app_screen.dart';
import 'package:zara_app/features/auth/sign_in_password_screen.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/features/auth/forgot_password_screen.dart';

class SignInPasswordScreen extends StatefulWidget {
  const SignInPasswordScreen({super.key});

  @override
  State<SignInPasswordScreen> createState() =>
      _SignInPasswordScreenState();
}

class _SignInPasswordScreenState
    extends State<SignInPasswordScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

      // هنا حطي الشاشة اللي عايزة تروحي لها بعد تسجيل الدخول
      // pushTo(context, const HomeScreen());
      
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
                    style: TextStyles.title1.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),

                  const Gap(28),

                 CustomTextfield(
                  hintText: 'Password',
                  obscureText: true,
                ),

                  const Gap(16),

               MainButton(
  title: 'Continue',
  ontap: () {
    pushReplacement(
      context,
      const MainAppScreen(),
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
