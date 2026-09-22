import 'package:flutter/material.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/constants/app_fonts.dart';
import 'package:zara_app/features/auth/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      pushReplacement(
        context,
        const SignInScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: Center(
        child: Text(
          'ZARA',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 55,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.gabarito,
          ),
        ),
      ),
    );
  }
}