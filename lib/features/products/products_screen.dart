import 'package:flutter/material.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';

// ==================== نموذج بيانات بسيط للمنتج ====================
// دلوقتي بيانات وهمية (dummy) عشان تشوفي الشكل شغال.
// بعدين تقدري تستبدليها بالداتا الحقيقية (API أو Firebase) بنفس الشكل بالظبط
class ProductItem {
  final String name;
  final String price;
  final String imageUrl; // ممكن يبقى asset path أو رابط نت

  ProductItem({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

final List<ProductItem> dummyProducts = [
  ProductItem(
    name: 'Club Fleece Mens Jacket',
    price: '\$56.97',
    imageUrl: 'https://picsum.photos/seed/jacket1/400/500',
  ),
  ProductItem(
    name: 'Skate Jacket',
    price: '\$150.97',
    imageUrl: 'https://picsum.photos/seed/jacket2/400/500',
  ),
  ProductItem(
    name: 'Therma Fit Puffer Jacket',
    price: '\$280.97',
    imageUrl: 'https://picsum.photos/seed/jacket3/400/500',
  ),
  ProductItem(
    name: "Men's Workwear Jacket",
    price: '\$128.97',
    imageUrl: 'https://picsum.photos/seed/jacket4/400/500',
  ),
];

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // متغيرات لحفظ آخر اختيار في كل فلتر
  String? selectedSort = 'Recommended';
  String? selectedDeal;
  String? selectedGender = 'Men';
  double? minPrice;
  double? maxPrice;

  // كنترولر خانة البحث - القيمة مش ثابتة، تقدري تعدّليها من الشاشة نفسها
  final TextEditingController _searchController =
      TextEditingController(text: 'Jacket');

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============ Search Bar ============
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: AppColors.greyColor),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: TextStyles.body
                                  .copyWith(color: AppColors.blackColor),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              onChanged: (value) {
                                setState(() {}); // تحدّث نتائج البحث لو حبيتي تفلتري لايف
                              },
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                setState(() => _searchController.clear());
                              },
                              child: Icon(Icons.close, color: AppColors.greyColor),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ============ صف الفلاتر ============
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                children: [
                  _filterChip(label: selectedDeal ?? 'On Sale', onTap: _showDealsSheet),
                  const SizedBox(width: 8),
                  _filterChip(label: 'Price', onTap: _showPriceSheet),
                  const SizedBox(width: 8),
                  _filterChip(label: selectedSort ?? 'Sort by', onTap: _showSortSheet),
                  const SizedBox(width: 8),
                  _filterChip(label: selectedGender ?? 'Men', onTap: _showMoreSheet),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ============ عدد النتائج ============
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${dummyProducts.length} Results Found',
                style: TextStyles.body.copyWith(color: AppColors.greyColor),
              ),
            ),

            const SizedBox(height: 8),

            // ============ Grid المنتجات ============
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: dummyProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return _productCard(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard(ProductItem product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.borderColor,
                    child: Icon(Icons.image_not_supported,
                        color: AppColors.greyColor),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.blackColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.body.copyWith(color: AppColors.blackColor),
        ),
        Text(
          product.price,
          style: TextStyles.body.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _filterChip({required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: TextStyles.body.copyWith(color: AppColors.whiteColor)),
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: AppColors.whiteColor, size: 18),
          ],
        ),
      ),
    );
  }

  // ==================== من هنا لتحت: نفس الكود بتاعك تمامًا من غير أي تعديل ====================

  // Sort By
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

  // Deals
  void _showDealsSheet() {
    _showOptionsSheet(
      title: 'Deals',
      options: const [
        'On sale',
        'Free Shipping Eligible',
      ],
      selected: selectedDeal,
      onSelected: (value) => setState(() => selectedDeal = value),
    );
  }

  // Gender (More)
  void _showMoreSheet() {
    _showOptionsSheet(
      title: 'Gender',
      options: const [
        'Men',
        'Women',
        'Kids',
      ],
      selected: selectedGender,
      onSelected: (value) => setState(() => selectedGender = value),
    );
  }

  // Price
  void _showPriceSheet() {
    final minController = TextEditingController(
      text: minPrice?.toString() ?? '',
    );
    final maxController = TextEditingController(
      text: maxPrice?.toString() ?? '',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
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
                    style: TextStyles.title2.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.borderColor),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.borderColor),
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
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // Bottom Sheet مشترك للاختيار الواحد (Single Select)
  void _showOptionsSheet({
    required String title,
    required List<String> options,
    required String? selected,
    required void Function(String? value) onSelected,
  }) {
    String? tempSelected = selected;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
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
                    ...options.map(
                      (option) {
                        final bool isSelected = option == tempSelected;
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
                                    Icon(Icons.check,
                                        color: AppColors.whiteColor, size: 18),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
