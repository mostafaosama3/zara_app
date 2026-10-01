
import 'package:flutter/material.dart';
import 'package:zara_app/core/styles/appcolor.dart';
// نحطها في ملق الويدجت
class CartItemTile extends StatelessWidget {
  final String title;
  final String size;
  final String colorName;
  final String price;
  final String imageUrl;

  const CartItemTile({
    Key? key,
    required this.title,
    required this.size,
    required this.colorName,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // معلومات المنتج (العنوان، المقاس، اللون)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    children: [
                      const TextSpan(text: 'Size - '),
                      TextSpan(
                        text: size,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const TextSpan(text: '   Color - '),
                      TextSpan(
                        text: colorName,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // السعر وأزرار التحكم بالكمية (+ / -)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildActionButton(Icons.add, AppColors.primaryColor, () {}),
                  const SizedBox(width: 6),
                  _buildActionButton(Icons.remove, AppColors.primaryColor, () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }  
}
Widget _buildActionButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 14,
          color: Colors.white,
        ),
      ),
    );
  }