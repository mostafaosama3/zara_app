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

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
    this.searchQuery,
  });

  final String? searchQuery;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? selectedSort = 'Recommended';
  String? selectedDeal = 'On Sale';
  String? selectedGender = 'Men';
  double? minPrice;
  double? maxPrice;

  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery ?? 'Jacket');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductModel> get filteredProducts {
    final query = _searchController.text.trim().toLowerCase();

    final items = products.where((product) {
      final matchesQuery = query.isEmpty ||
          product.name.toLowerCase().contains(query) ||
          product.category.toLowerCase().contains(query);
      final matchesPrice =
          (minPrice == null || product.price >= minPrice!) &&
          (maxPrice == null || product.price <= maxPrice!);
      return matchesQuery && matchesPrice;
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

  void _showSortSheet() {
    _showOptionsSheet(
      title: 'Sort by',
      options: const [
        'Recommended',
        'Newest',
        'Lowest - Highest Price',
        'Highest - Lowest Price',
      ],
      selected: selectedSort,
      onSelected: (value) => setState(() => selectedSort = value),
    );
  }

  void _showDealsSheet() {
    _showOptionsSheet(
      title: 'Deals',
      options: const [
        'On Sale',
        'Free Shipping Eligible',
      ],
      selected: selectedDeal ?? 'On Sale',
      onSelected: (value) => setState(() => selectedDeal = value),
    );
  }

  void _showMoreSheet() {
    _showOptionsSheet(
      title: 'Gender',
      options: const ['Men', 'Women', 'Kids'],
      selected: selectedGender,
      onSelected: (value) => setState(() => selectedGender = value),
    );
  }

  void _showPriceSheet() {
    final minController = TextEditingController(text: minPrice?.toString() ?? '');
    final maxController = TextEditingController(text: maxPrice?.toString() ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
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
                  Text(
                    'Price',
                    style: TextStyles.title2.copyWith(color: AppColors.blackColor),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: AppColors.blackColor),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: minController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Min Price',
                        filled: true,
                        fillColor: AppColors.accentColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                        labelText: 'Max Price',
                        filled: true,
                        fillColor: AppColors.accentColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      minPrice = double.tryParse(minController.text);
                      maxPrice = double.tryParse(maxController.text);
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Apply',
                    style: TextStyles.body.copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showOptionsSheet({
    required String title,
    required List<String> options,
    required String? selected,
    required void Function(String? value) onSelected,
  }) {
    String? tempSelected = selected;

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
                            setModalState(() => tempSelected = null);
                          },
                          child: Text(
                            'Clear',
                            style: TextStyles.body.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        Text(
                          title,
                          style: TextStyles.title2.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            onSelected(tempSelected);
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close, color: AppColors.blackColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ...options.map((option) {
                      final isSelected = option == tempSelected;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.borderColor,
                              foregroundColor: isSelected
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            onPressed: () {
                              setModalState(() => tempSelected = option);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  option,
                                  style: TextStyles.body.copyWith(
                                    color: isSelected
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check,
                                    color: AppColors.whiteColor,
                                    size: 18,
                                  ),
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

  @override
  Widget build(BuildContext context) {
    final results = filteredProducts;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Row(
                children: [
                  AppBackButton(
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                    
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomSvgImage(
                             path: AppIcons.searchSvg,
                             width: 20,
                             height: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: TextStyles.body.copyWith(color: AppColors.blackColor),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                setState(() => _searchController.clear());
                              },
                              child: Icon(Icons.close, color: AppColors.blackColor, size: 20),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                children: [
                  _filterChip(
                    label: selectedDeal ?? 'On Sale',
                    onTap: _showDealsSheet,
                    isSelected: selectedDeal != null,
                  ),
                  const SizedBox(width: 8),
                  _filterChip(
                    label: 'Price',
                    onTap: _showPriceSheet,
                    isSelected: minPrice != null || maxPrice != null,
                  ),
                  const SizedBox(width: 8),
                  _filterChip(
                    label: selectedSort ?? 'Sort by',
                    onTap: _showSortSheet,
                    isSelected: selectedSort != null && selectedSort != 'Recommended',
                  ),
                  const SizedBox(width: 8),
                  _filterChip(
                    label: selectedGender ?? 'Men',
                    onTap: _showMoreSheet,
                    isSelected: selectedGender != null && selectedGender != 'Men',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${results.length} Results Found',
                style: TextStyles.body.copyWith(color: AppColors.greyColor),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: results.isEmpty
                  ? const Center(child: Text('No products found'))
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: results.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.72,
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
    bool isSelected = false,
  }) {
    final backgroundColor = isSelected ? AppColors.primaryColor : AppColors.accentColor;
    final foregroundColor = isSelected ? AppColors.whiteColor : AppColors.blackColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyles.body.copyWith(color: foregroundColor),
            ),
            const SizedBox(width: 10),
            CustomSvgImage(
              path: AppIcons.arrowdownSvg,
              width: 10,
              height: 10,
              color: foregroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
