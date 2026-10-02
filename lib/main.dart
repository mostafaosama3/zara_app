import 'package:flutter/material.dart';
import 'package:zara_app/core/constants/app_fonts.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/features/Main/main_app_screen.dart';
import 'package:zara_app/features/home/home_screen.dart';
import 'package:zara_app/features/product_details/page/product_details_screen.dart';
import 'package:zara_app/features/shop/page/cart_screen.dart';
import 'package:zara_app/features/shop/page/notification.dart';
import 'package:zara_app/features/shop/page/order.dart';
import 'package:zara_app/features/shop/page/order_list_screen.dart';
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
        appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor),
        scaffoldBackgroundColor: AppColors.whiteColor,
      ),
      home: const SplashScreen(),
    );
  }
}
