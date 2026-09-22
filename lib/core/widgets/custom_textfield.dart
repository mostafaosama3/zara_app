import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.title,
    required this.hintText,
    this.prefixicon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
  });

  final String? title;
  final String hintText;
  final Widget? prefixicon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: TextStyles.title2.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          const Gap(8),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.accentColor,
            prefixIcon: prefixicon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyles.caption2.copyWith(
              color: AppColors.greyColor,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.redColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}