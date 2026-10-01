import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/features/home/home_screen.dart';
import 'package:zara_app/features/shop/page/notification.dart';
import 'package:zara_app/features/shop/page/order.dart';


class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});
  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  final List<Widget> Screens = [
    const HomeScreen(),
    const Notifications(),
    const OrderScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Container _bottomNavBar() {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.09),
            blurRadius: 14,
            spreadRadius: 0,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.homeSvg,color: AppColors.blackColor),
            activeIcon: CustomSvgImage(
              path: AppImages.homeSvg,
              color: AppColors.primaryColor,
            ),
           label: "",
          ),
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.notificationSvg,color: AppColors.blackColor),
            activeIcon: CustomSvgImage(
              path: AppImages.notificationSvg,
              color: AppColors.primaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.receiptSvg,color: AppColors.blackColor,),
            activeIcon: CustomSvgImage(
              path: AppImages.receiptSvg,
              color: AppColors.primaryColor,
            ),
          label: "",
          ),
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.profileSvg,color: AppColors.blackColor),
            activeIcon: CustomSvgImage(
              path: AppImages.profileSvg,
              color: AppColors.primaryColor,
            ),
           label: "",
          ),
      
        ],
      ),
    );
  }
}
