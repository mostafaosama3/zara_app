import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/core/widgets/custom_textfield.dart';
import 'package:zara_app/core/widgets/main_button.dart';
import 'package:zara_app/data/models/user_cart_model.dart';
import 'package:zara_app/features/shop/page/cart_item.dart';
import 'package:zara_app/features/shop/page/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> get items => CartStore.items;

  double get subtotal => CartStore.subtotal;

  double get shippingCost => CartStore.shippingCost;

  double get tax => CartStore.tax;

  double get total => CartStore.total;

  void _increaseQuantity(int index) {
    setState(() => CartStore.increaseAt(index));
  }

  void _decreaseQuantity(int index) {
    setState(() => CartStore.decreaseAt(index));
  }

  void _removeAll() {
    setState(() => CartStore.removeAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(onTap: () => Navigator.pop(context)),
                  Text(
                    'Cart',
                    style: TextStyles.subtitle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Gap(40),
                ],
              ),
              const Gap(20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: items.isEmpty ? null : _removeAll,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  child: Text(
                    'Remove All',
                    style: TextStyles.body.copyWith(color: AppColors.blackColor),
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                child: items.isEmpty
                    ? const Center(
                        child: Text('Your cart is empty.'),
                      )
                    : ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return CartItemTile(
                            title: item.product.name,
                            size: item.size,
                            colorName: item.color,
                            price: '\$${item.totalPrice.toStringAsFixed(2)}',
                            imageUrl: item.product.path,
                            quantity: item.quantity,
                            onIncrease: () => _increaseQuantity(index),
                            onDecrease: () => _decreaseQuantity(index),
                          );
                        },
                      ),
              ),
              Payment_info(title: 'Subtotal', price: subtotal.toStringAsFixed(2)),
              Payment_info(title: 'Shipping Cost', price: shippingCost.toStringAsFixed(2)),
              Payment_info(title: 'Tax', price: tax.toStringAsFixed(2)),
              Payment_info(title: 'Total', price: total.toStringAsFixed(2)),
              const SizedBox(height: 20),
              CustomTextfield(
                hintText: 'Enter Coupon Code',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {},
                    icon: CustomSvgImage(
                      path: AppIcons.arrowrightSvg,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                prefixicon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSvgImage(path: AppImages.couponSvg),
                ),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: MainButton(
                  title: 'CheckOut',
                  ontap: () => pushTo(context, const CheckoutScreen()),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class Payment_info extends StatelessWidget {
  const Payment_info({super.key, required this.title, required this.price});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.body.copyWith(color: AppColors.greyColor),
          ),
          Text(
            '\$$price',
            style: TextStyles.body.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


