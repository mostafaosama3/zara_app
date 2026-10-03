import 'package:flutter/material.dart';
import 'package:zara_app/core/widgets/app_image.dart';

class ProductImage extends StatelessWidget {
  final String url;

  const ProductImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          16,
        ), 
        child: SizedBox(
          height: 350, 
          width: double.infinity,
          child: AppImage(
            path: url,
            fit: BoxFit.contain,  
          ),
        ),
      ),
    );
  }


}
