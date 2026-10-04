import 'package:flutter/material.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/widgets/app_image.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/data/models/product_model.dart';
import 'package:zara_app/features/settings/wishlist_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.imageHeight = 158,
  });

  final ProductModel product;
  final VoidCallback onTap;
  final double imageHeight;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = WishlistStore.contains(widget.product);
  }

  String _formatPrice(double price) => price.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final path = product.path;

    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                child: Container(
                  height: widget.imageHeight,
                  width: double.infinity,
                  color: const Color(0xFFF3F3F3),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppImage(
                        path: path,
                        width: double.infinity,
                        height: widget.imageHeight,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 36,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Material(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {
                              WishlistStore.toggle(widget.product);
                              if (mounted) {
                                setState(() {
                                  _isFavorite = WishlistStore.contains(widget.product);
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: CustomSvgImage(
                                path: AppImages.heartSvg,
                                width: 18,
                                height: 18,
                                color: _isFavorite ? Colors.red : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          '\$${_formatPrice(product.price)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        if (product.oldPrice != null) ...[
                          const SizedBox(width: 6),
                          Text(
                            '\$${_formatPrice(product.oldPrice!)}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
