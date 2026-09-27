import 'package:flutter/material.dart';
import 'package:zara_app/core/styles/appcolor.dart';

class SelectableField extends StatelessWidget {
  const SelectableField({
    required this.label,
    required this.value,
    required this.onTap,
    this.colorDot,
    super.key,
  });

  final String label;
  final String value;
  final Color? colorDot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            Row(
              children: [
                if (colorDot != null) ...[
                  CircleAvatar(backgroundColor: colorDot, radius: 6),
                  const SizedBox(width: 8),
                ],
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
