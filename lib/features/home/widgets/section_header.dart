import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.onSeeAll,
    this.titleColor = Colors.black,
  });

  final String title;
  final VoidCallback onSeeAll;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        InkWell(
          onTap: onSeeAll,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text('See All', style: TextStyle(fontSize: 14)),
          ),
        ),
      ],
    );
  }
}
