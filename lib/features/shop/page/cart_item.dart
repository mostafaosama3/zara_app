
import 'package:flutter/material.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';

class CartItemTile extends StatelessWidget {
  final String title;
  final String size;
  final String colorName;
  final String price;
  final String imageUrl;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemTile({
    super.key,
    required this.title,
    required this.size,
    required this.colorName,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    const rightColumnWidth = 86.0;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  'Size - $size',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.caption1.copyWith(color: AppColors.greyColor),
                ),
                const SizedBox(height: 2),
                Text(
                  'Color - $colorName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.caption1.copyWith(color: AppColors.greyColor),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: rightColumnWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    price,
                    maxLines: 1,
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Qty: $quantity',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildActionButton(Icons.remove, AppColors.primaryColor, onDecrease),
                    const SizedBox(width: 6),
                    _buildActionButton(Icons.add, AppColors.primaryColor, onIncrease),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
}