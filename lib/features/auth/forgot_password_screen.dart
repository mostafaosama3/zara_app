import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/features/auth/email_sent_screen.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                  'Forgot Password',
                  style: TextStyles.title1.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),

                const Gap(28),

                const CustomTextfield(
                  hintText: 'Enter Email address',
                ),

                const Gap(24),

              MainButton(
  title: 'Continue',
  ontap: () {
    pushTo(
      context,
      const EmailSentScreen(),
    );
  },
),
              ],
            ),
          ),
        ),
      ),
    );
  }
}