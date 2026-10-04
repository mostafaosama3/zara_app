import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/data/models/product_model.dart';
import 'package:zara_app/features/home/pages/categories_screen.dart';
import 'package:zara_app/features/home/pages/category_products_screen.dart';
import 'package:zara_app/features/home/widgets/category_tile.dart';
import 'package:zara_app/features/home/widgets/product_carousel.dart';
import 'package:zara_app/features/product_details/page/product_details_screen.dart';
import 'package:zara_app/features/products/products_screen.dart';
import 'package:zara_app/features/shop/page/cart_screen.dart';
import '../widgets/home_header.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _openCategory(BuildContext context, ShopCategory category) {
    pushTo(
      context,
      CategoryProductsScreen(categoryName: category.name),
    );
  }

  void _openProduct(BuildContext context, ProductModel product) {
    pushTo(context, ProductDetailsScreen(product: product));
  }

  void _openSearchResults() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;

    pushTo(context, ProductsScreen(searchQuery: query));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                onCartTap: () => pushTo(context, CartScreen()),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _searchController,
                  onSubmitted: (_) => _openSearchResults(),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: _openSearchResults,
                        child: CustomSvgImage(
                          path: AppIcons.searchSvg,
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(22),
              SectionHeader(
                title: 'Categories',
                onSeeAll: () => pushTo(context, CategoriesScreen()),
              ),
              const Gap(14),
              SizedBox(
                height: 88,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: shopCategories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final category = shopCategories[index];
                    return CategoryTile(
                      category: category,
                      compact: true,
                      onTap: () => _openCategory(context, category),
                    );
                  },
                ),
              ),
              const Gap(20),
              SectionHeader(title: 'Top Selling', onSeeAll: () {}),
              const SizedBox(height: 12),
              ProductCarousel(
                products: featuredProducts,
                onProductTap: (product) => _openProduct(context, product),
              ),
              const SizedBox(height: 22),
              SectionHeader(
                title: 'New In',
                titleColor: AppColors.primaryColor,
                onSeeAll: () {},
              ),
              const Gap(12),
              ProductCarousel(
                products: newProducts,
                onProductTap: (product) => _openProduct(context, product),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
