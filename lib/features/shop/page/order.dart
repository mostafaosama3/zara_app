import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/functions/Navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/features/auth/pages/sign_in_screen.dart';
import 'package:zara_app/features/home/pages/categories_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Order",style: TextStyles.body.copyWith(fontWeight: .bold,fontSize: 18),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.checkout,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const Gap(28),
              Text(
                'No Orders yet',
                textAlign: TextAlign.center,
                style: TextStyles.headline2.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(24),
              SizedBox(
                width: 190,
                height: 52,
                child:MainButton(title: "Explore Categories", ontap: () {
                  pushReplacement(context, const CategoriesScreen());
                })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
