import 'package:flutter/material.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/features/home/widgets/product_card.dart';
import 'package:zara_app/features/product_details/page/product_details_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final category = categoryForName(categoryName);
    final displayedName = category?.name ?? categoryName;
    final categoryProducts = products
        .where(
          (product) =>
              product.category.toLowerCase() == displayedName.toLowerCase(),
        )
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(onTap: () => Navigator.of(context).maybePop()),
              const SizedBox(height: 14),
              Text(
                '$displayedName (${categoryProducts.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: categoryProducts.isEmpty
                    ? const Center(
                        child: Text('No products found in this category.'),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: categoryProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 14,
                              childAspectRatio: 0.72,
                            ),
                        itemBuilder: (context, index) {
                          final product = categoryProducts[index];
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
      ),
    );
  }
}
