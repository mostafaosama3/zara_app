import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/constants/app_fonts.dart';
import 'package:zara_app/core/styles/text_styles.dart';

 class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
     // push To signin screen
    });
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child:Text("ZARA",style: TextStyle(color: AppColors.whiteColor,fontSize: 55,fontWeight: .w400,fontFamily:AppFonts.gabarito),)),
    );
  }
}