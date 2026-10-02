import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/features/auth/email_sent_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
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
        const EmailSentScreen(),
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
                    'Forgot Password',
                    style: TextStyles.title1.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Gap(28),

                  CustomTextfield(
                    hintText: 'Enter Email address',
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),

                  const Gap(24),

                  MainButton(
                    title: 'Continue',
                    ontap: continueButton,
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