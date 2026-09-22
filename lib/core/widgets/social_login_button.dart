import 'package:flutter/material.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  final String title;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.accentColor,
          foregroundColor: AppColors.blackColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          children: [
            CustomSvgImage(
              path: iconPath,
              width: 20,
              height: 20,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Text(
              title,
              style: TextStyles.caption1.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}