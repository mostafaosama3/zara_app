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
  // متغيرات لحفظ الاختيارات الحالية
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

  String _formatPrice(double price) => price == price.truncateToDouble()
      ? price.toStringAsFixed(0)
      : price.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
                  // 1. صور المنتج (معرض الصور الأفقي)
                  ProductImage(url: product.path),

                  const Gap(16),

                  // 2. اسم المنتج والسعر
                  Text(product.name, style: TextStyles.subtitle),
                  const Gap(4),
                  Text(
                    "\$${_formatPrice(product.price)}",
                    style: TextStyles.body.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Gap(20),

                  // 3. خانة اختيار المقاس (Size selector)
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

                  // 4. خانة اختيار اللون (Color selector)
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

                  // 5. الكمية (Quantity)
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
                                backgroundColor: Color(0xFF8E6CEF),
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
                                backgroundColor: Color(0xFF8E6CEF),
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

                  // 6. الوصف (Description)
                  Text(
                    product.description,
                    style: TextStyle(color: AppColors.greyColor, height: 1.5),
                  ),
                  const Gap(20),

                  // 7. الشحن والإرجاع (Shipping & Returns)
                  const Text("Shipping & Returns", style: TextStyles.body),
                  const Gap(4),
                  Text(
                    "Free standard shipping and free 60-day returns",
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 8. التقييمات والمراجعات (Reviews & Ratings)
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

                  // مراجعة 1
                  const ReviewItem(
                    name: "Alex Morgan",
                    rating: 4,
                    comment: "Gucci transcends its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
                    time: "12 days ago",
                  ),
                  const Divider(height: 32),
                  // مراجعة 2
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

          // 9. زرار الشراء الثابت في الأسفل (Buy/Add to Bag Button)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: AppColors.whiteColor,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8E6CEF),
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
                      "\$${_formatPrice(product.price * quantity)}",
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
