import 'package:flutter/material.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/data/models/product_model.dart';
import 'package:zara_app/features/home/widgets/product_card.dart';
import 'package:zara_app/features/product_details/page/product_details_screen.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  late final TextEditingController _searchController;
  String selectedSort = 'Recommended';
  String selectedDeal = 'On Sale';
  String selectedGender = 'Men';
  double? minPrice;
  double? maxPrice;

  @override
  void initState() {
    super.initState();
    final category = categoryForName(widget.categoryName);
    _searchController = TextEditingController(text: category?.name ?? widget.categoryName);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String get displayedName {
    final category = categoryForName(widget.categoryName);
    return category?.name ?? widget.categoryName;
  }

  List<ProductModel> get filteredProducts {
    final query = _searchController.text.trim().toLowerCase();

    final items = products.where((product) {
      final sameCategory =
          product.category.toLowerCase() == displayedName.toLowerCase();
      final matchesQuery = query.isEmpty ||
          query == displayedName.toLowerCase() ||
          product.name.toLowerCase().contains(query);
      final matchesPrice =
          (minPrice == null || product.price >= minPrice!) &&
          (maxPrice == null || product.price <= maxPrice!);

      return sameCategory && matchesQuery && matchesPrice;
    }).toList();

    switch (selectedSort) {
      case 'Newest':
        items.sort((a, b) => b.id.compareTo(a.id));
        break;
      case 'Lowest - Highest Price':
        items.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Highest - Lowest Price':
        items.sort((a, b) => b.price.compareTo(a.price));
        break;
      default:
        break;
    }

    return items;
  }

  void _showOptionsSheet({
    required String title,
    required List<String> options,
    required String selected,
    required void Function(String value) onSelected,
  }) {
    String tempValue = selected;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setModalState(() => tempValue = options.first);
                          },
                          child: const Text('Clear'),
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            onSelected(tempValue);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ...options.map((option) {
                      final isSelected = option == tempValue;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.accentColor,
                              foregroundColor: isSelected
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            onPressed: () => setModalState(() => tempValue = option),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(option),
                                if (isSelected) const Icon(Icons.check, size: 18),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showPriceSheet() {
    final minController = TextEditingController(text: minPrice?.toString() ?? '');
    final maxController = TextEditingController(text: maxPrice?.toString() ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: minController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Min',
                        filled: true,
                        fillColor: AppColors.accentColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: maxController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Max',
                        filled: true,
                        fillColor: AppColors.accentColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      minPrice = double.tryParse(minController.text);
                      maxPrice = double.tryParse(maxController.text);
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = filteredProducts;

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  AppBackButton(onTap: () => Navigator.pop(context)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        displayedName,
                        style: TextStyles.subtitle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
             
            ),
            const SizedBox(height: 8),
            Expanded(
              child: results.isEmpty
                  ? const Center(child: Text('No products found in this category.'))
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: results.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.62,
                      ),
                      itemBuilder: (context, index) {
                        final product = results[index];
                        return ProductCard(
                          product: product,
                          imageHeight: 185,
                          onTap: () => pushTo(
                            context,
                            ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterChip({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyles.body.copyWith(
                color: AppColors.whiteColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            Icon(Icons.keyboard_arrow_down, color: AppColors.whiteColor, size: 16),
          ],
        ),
      ),
    );
  }
}
