import 'package:flutter/material.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/widgets/app_image.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/data/models/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.imageHeight = 180,
  });

  final ProductModel product;
  final VoidCallback onTap;
  final double imageHeight;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  String _formatPrice(double price) => price.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final path = product.path;

    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: widget.imageHeight,
              width: double.infinity,
              color: const Color(0xFFF4F4F4),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(
                    path: path,
                    width: double.infinity,
                    height: widget.imageHeight,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 36,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7,
                    right: 7,
                    child: Material(
                      color: Colors.white.withValues(alpha: 0.85),
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => setState(() => _isFavorite = !_isFavorite),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: CustomSvgImage(path: AppImages.heartSvg),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Text(
                '\$${_formatPrice(product.price)}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (product.oldPrice != null) ...[
                const SizedBox(width: 6),
                Text(
                  '\$${_formatPrice(product.oldPrice!)}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
