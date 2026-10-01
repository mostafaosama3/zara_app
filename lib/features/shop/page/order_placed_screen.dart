import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/data/models/order.dart';
import 'package:zara_app/features/shop/page/track_order_screen.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({
    super.key,
    required this.order,
    required this.total,
  });

  final OrderModel order;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: .center,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Image.asset(AppImages.orderplaced,fit:BoxFit.cover,),
              ),
            ),
          ),
        
          Expanded(
            child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor, 
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(30),
                       Text(
                        'Order Placed\nSuccessfully',
                        textAlign: TextAlign.center,
                        style: TextStyles.headline1.copyWith(
                          fontWeight: .bold,
                          height: 1.2,
                        ),
                      ),
                      
                      const Gap(30),
                      
                      // العنوان الفرعي
                       Text(
                        'You will receive an email confirmation',
                        textAlign: TextAlign.center,
                        style: TextStyles.body.copyWith(
                          color: AppColors.greyColor
                        )
                      ),
                      const Gap(100),
                      MainButton(title: "See Order details", ontap: (){
                        pushTo(context, TrackOrderScreen(order: order));
                      }),
                      const Gap(10),
                  ],
                  ),
                  ),
          ),
          
        ],
        ),
      ),
    );
  }
}