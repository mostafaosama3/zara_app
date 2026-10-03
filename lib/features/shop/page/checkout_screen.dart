import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/data/models/order.dart';
import 'package:zara_app/features/shop/page/cart_screen.dart';
import 'package:zara_app/features/shop/page/order_placed_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  
    
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(onTap: () {}),
        ),
        title: Text(
          "Checkout",
          style: TextStyles.body.copyWith(fontWeight: .bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),

            CheckoutInfo(
              title: 'Shipping Address',
              subtitle: "2715 Ash Dr. San Jose, South Dakota 83475",
            ),

            const Gap(20),
            CheckoutInfo(title: 'Payment Method', subtitle: "**** 4187",iconWidget:  CustomSvgImage(
                    path: AppIcons.mastercardSvg, 
                    width: 24,
                  ),),
            Gap(20),

            const Spacer(),
            Payment_info(title: "Subtotal", price: "65"),
            Payment_info(title: "Shipping Cost", price: "8.00"),
            Payment_info(title: "Tax", price: "0.00"),
            Payment_info(title: "Total", price: "73.00"), 
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: MainButton(
                title: 'Place Order',
                ontap: () =>  pushReplacement(context, OrderPlacedScreen(order: orders.first, total: 73)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class const CheckoutInfo({
  super.key,
  required this.title,
  required this.subtitle, this.iconWidget,
}) extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? iconWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.accentColor, // لون الخلفية الرمادي الفاتح
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            title: Text(
              title,
              style: TextStyles.caption1.copyWith(color: AppColors.greyColor),
              maxLines: 1,
              overflow: .ellipsis,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
              ), // مسافة بسيطة بين العنوان والتحتاني
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      subtitle,
                      style: TextStyles.body.copyWith(fontWeight: .bold),
                     maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                
                  // أيكونة الماستركارد (أو استخدم CustomSvgImage لو عندك)
                if(iconWidget!=null)...[
                 iconWidget!,
                ],
                ],
              ),
            ),
            trailing: CustomSvgImage(
              path: AppIcons.arrowrightSvg,
              color: AppColors.blackColor,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
