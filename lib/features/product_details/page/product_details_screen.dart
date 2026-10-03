import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/app_favourite_button.dart';
import 'package:zara_app/data/models/product_model.dart';
import 'package:zara_app/features/product_details/widgets/color_bottom_sheet.dart';
import 'package:zara_app/features/product_details/widgets/product_image.dart';
import 'package:zara_app/features/product_details/widgets/review_item.dart';
import 'package:zara_app/features/product_details/widgets/selectable_field.dart';
import 'package:zara_app/features/product_details/widgets/size_bottom_sheet.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedSize = '';
  late String selectedColor;
  late Color selectedColorValue;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product.sizes.isEmpty
        ? ''
        : widget.product.sizes.first;
    selectedColor = widget.product.color;
    selectedColorValue = _colorFor(widget.product.color);
  }

  Color _colorFor(String colorName) {
    for (final option in ColorBottomSheet.colors) {
      if (option.name.toLowerCase() == colorName.toLowerCase()) {
        return option.color;
      }
    }
    return AppColors.greyColor;
  }

  
  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: AppBackButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          onPressed: () {},
        ),
        actions: [AppFavouriteButton(onTap: () {})],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(url: product.path),
                  const Gap(16),
                  Text(product.name, style: TextStyles.subtitle),
                  const Gap(4),
                  Text(
                    "\$${(product.price)}",
                    style: TextStyles.body.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Gap(20),
                  if (product.sizes.isNotEmpty) ...[
                    SelectableField(
                      label: "Size",
                      value: selectedSize,
                      onTap: () => SizeBottomSheet.show(
                        context: context,
                        selectedSize: selectedSize,
                        availableSizes: product.sizes,
                        onSelected: (size) =>
                            setState(() => selectedSize = size),
                      ),
                    ),
                    const Gap(12),
                  ],
                  SelectableField(
                    label: "Color",
                    value: selectedColor,
                    colorDot: selectedColorValue,
                    onTap: () => ColorBottomSheet.show(
                      context: context,
                      selectedColor: selectedColor,
                      onSelected: (colorName) {
                        final color = _colorFor(colorName);
                        setState(() {
                          selectedColor = colorName;
                          selectedColorValue = color;
                        });
                      },
                    ),
                  ),
                  const Gap(12),

                  // Quantity
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Quantity",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (quantity > 1) setState(() => quantity--);
                              },
                              child: const CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColors.primaryColor,
                                child: Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                "$quantity",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => quantity++),
                              child: const CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColors.primaryColor,
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),

                  // Description
                  Text(
                    product.description,
                    style: TextStyle(color: AppColors.greyColor, height: 1.5),
                  ),
                  const Gap(20),

                  // 7.Shipping & Returns
                  const Text("Shipping & Returns", style: TextStyles.body),
                  const Gap(4),
                  Text(
                    "Free standard shipping and free 60-day returns",
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const Gap(24),

                  // Reviews & Ratings
                  Text(
                    "Reviews",
                    style: TextStyles.body.copyWith(fontWeight: .w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "4.5 Ratings",
                    style: TextStyles.headline2.copyWith(fontWeight: .bold),
                  ),
                  const Text(
                    "213 Reviews",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  
                  const ReviewItem(
                    name: "Alex Morgan",
                    rating: 4,
                    comment: "Gucci transcends its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
                    time: "12 days ago",
                  ),
                  const Divider(height: 32),
                  
                  const ReviewItem(
                    name: "Andress",
                    rating: 3,
                    comment: "Gucci transcends its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
                    time: "12 days ago",
                  ),
                ],
              ),
            ),
          ),

          // Buy/Add to Bag Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: AppColors.whiteColor,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${(product.price * quantity)}",
                      style: TextStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),

                    Text(
                      "Add to Bag",
                      style: TextStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
