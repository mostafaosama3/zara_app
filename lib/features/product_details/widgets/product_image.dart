import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String url;

  const ProductImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ), // نفس المسافة الجانبية للديزاين
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          16,
        ), // حواف دائرية خفيفة لكل الصورة كارت واحد
        child: SizedBox(
          height: 350, // الطول المناسب بالظبط زي التصميم
          width: double.infinity,
          child: url.startsWith('http')
              ? Image.network(
                  url,
                  fit: BoxFit.contain,
                  errorBuilder: _imageError,
                )
              : Image.asset(
                  url,
                  fit: BoxFit.contain,
                  errorBuilder: _imageError,
                ),
        ),
      ),
    );
  }

  Widget _imageError(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return Container(
      color: Colors.grey[200],
      child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
    );
  }
}
