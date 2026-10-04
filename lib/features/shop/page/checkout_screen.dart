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
import 'package:zara_app/data/models/user_cart_model.dart';
import 'package:zara_app/features/shop/page/cart_screen.dart';
import 'package:zara_app/features/shop/page/order_placed_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subtotal = CartStore.subtotal;
    final shippingCost = CartStore.shippingCost;
    final tax = CartStore.tax;
    final total = CartStore.total;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(onTap: () => Navigator.pop(context)),
        ),
        title: Text(
          'Checkout',
          style: TextStyles.body.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            const CheckoutInfo(
              title: 'Shipping Address',
              subtitle: '2715 Ash Dr. San Jose, South Dakota 83475',
            ),
            const Gap(20),
            CheckoutInfo(
              title: 'Payment Method',
              subtitle: '**** 4187',
              iconWidget: CustomSvgImage(
                path: AppIcons.mastercardSvg,
                width: 24,
              ),
            ),
            const Gap(20),
            const Spacer(),
            Payment_info(title: 'Subtotal', price: subtotal.toStringAsFixed(2)),
            Payment_info(title: 'Shipping Cost', price: shippingCost.toStringAsFixed(2)),
            Payment_info(title: 'Tax', price: tax.toStringAsFixed(2)),
            Payment_info(title: 'Total', price: total.toStringAsFixed(2)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: MainButton(
                title: 'Place Order',
                ontap: () => pushReplacement(
                  context,
                  OrderPlacedScreen(order: orders.first, total: total),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutInfo extends StatelessWidget {
  const CheckoutInfo({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconWidget,
  });

  final String title;
  final String subtitle;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          title,
          style: TextStyles.caption1.copyWith(color: AppColors.greyColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  subtitle,
                  style: TextStyles.body.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (iconWidget != null) ...[
                const SizedBox(width: 8),
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
    );
  }
}
