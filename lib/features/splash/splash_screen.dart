import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/constants/app_fonts.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/features/products/products_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductsScreen(),
        ),
      );
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          "ZARA",
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