import 'package:flutter/material.dart';
import 'package:zara_app/data/models/product_model.dart';
import 'package:zara_app/features/home/widgets/product_card.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({required this.products, required this.onProductTap});

  final List<ProductModel> products;
  final ValueChanged<ProductModel> onProductTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 242,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return SizedBox(
            width: 158,
            child: ProductCard(
              product: product,
              imageHeight: 186,
              onTap: () => onProductTap(product),
            ),
          );
        },
      ),
    );
  }
}
