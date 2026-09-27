import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zara_app/core/styles/appcolor.dart';

class AppFavouriteButton extends StatelessWidget {
  const AppFavouriteButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.accentColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
         Iconsax.heart_copy,
          size: 20,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}