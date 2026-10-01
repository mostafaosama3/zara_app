import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/data/models/product_model.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List wishlistProducts = products.take(4).toList();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: AppBackButton(
              onTap: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'Wishlist (${wishlistProducts.length})',
          style: TextStyles.title2.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: wishlistProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final product = wishlistProducts[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          product.image,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CustomSvgImage(
                          path: AppImages.heartSvg,
                          color: AppColors.redColor,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyles.caption1.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(6),
                        Text(
                          '\$${product.price}',
                          style: TextStyles.body.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}