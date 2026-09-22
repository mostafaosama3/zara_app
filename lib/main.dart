import 'package:flutter/material.dart';
import 'package:zara_app/core/constants/app_fonts.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/features/splash/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
         splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
        fontFamily: AppFonts.circularStd,
        scaffoldBackgroundColor: AppColors.whiteColor,),
      home: const SplashScreen(),
      
    );
  }
}
