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
import 'package:zara_app/features/shop/page/cart_item.dart';
import 'package:zara_app/features/shop/page/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                    style: TextStyles.subtitle.copyWith(fontWeight: .bold),
                  ),
                  const Gap(40), 
                ],
              ),
              const Gap(20),
              // Remove All Button ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  child: Text('Remove All', style: TextStyles.body.copyWith(color: AppColors.blackColor)),
                ),
              ),
              const Gap(10),
              //  Cart Items List ---
              Expanded(
                child: ListView(
            
                  children: const [
                    CartItemTile(
                      title: "Men's Relaxed Fit Hoodie",
                      size: 'M',
                      colorName: 'Green',
                      price: '\$40',
                      imageUrl: "https://image.hm.com/assets/hm/28/50/2850d008f620127bb968cb432a5f0914022d7f6d.jpg?imwidth=2160", // استبدلها برابط الصورة أو Image.asset
                    ),
                    Gap(12),
                    CartItemTile(
                      title: "Basic Cotton T-Shirt",
                      size: 'M',
                      colorName: 'White',
                      price: '\$25',
                      imageUrl: 'https://m.media-amazon.com/images/I/51aokCATY3L._AC_SY741_.jpg', // استبدلها برابط الصورة أو Image.asset
                    ),
                  ],
                ),
              ),

              // --- 4. Payment Summary ---
              Payment_info(title: "Subtotal", price: "65"),
              Payment_info(title: "Shipping Cost", price: "8.00"),
              Payment_info(title: "Tax", price: "0.00"),
              Payment_info(title: "Total", price: "73.00"),

              const SizedBox(height: 20),

              // --- 5. Coupon Code Input Field ---
               CustomTextfield(hintText: "Enter Coupon Code",
               suffixIcon: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor:  AppColors.primaryColor,
                  ),
                  onPressed: (){},
                   icon:
                   CustomSvgImage(path: AppIcons.arrowrightSvg,color: AppColors.whiteColor,)),
               ),
               prefixicon: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CustomSvgImage(path: AppImages.couponSvg,),
               ),),
              const Gap(20),

              //  Checkout Button ---
              SizedBox(
                width: double.infinity,
                height: 56,
                child: MainButton(
                  title: "CheckOut",
                  ontap: () => pushTo(context,const CheckoutScreen() ),
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

class const Payment_info({super.key, required this.title, required this.price})
    extends StatelessWidget {
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.body.copyWith(color: AppColors.greyColor),
          ),
          Text(
            '\$${price}',
            style: TextStyles.body.copyWith(fontWeight: .bold),
          ),
        ],
      ),
    );
  }
}


