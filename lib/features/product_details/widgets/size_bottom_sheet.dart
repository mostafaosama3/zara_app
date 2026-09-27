import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';

class SizeBottomSheet {
  static const sizes = ['S', 'M', 'L', 'XL', '2XL'];

  static void show({
    required BuildContext context,
    required String selectedSize,
    List<String>? availableSizes,
    required ValueChanged<String> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _SizeSheetContent(
        selectedSize: selectedSize,
        sizes: availableSizes ?? sizes,
        onSelected: onSelected,
      ),
    );
  }
}

class _SizeSheetContent extends StatelessWidget {
  const _SizeSheetContent({
    required this.selectedSize,
    required this.sizes,
    required this.onSelected,
  });

  final String selectedSize;
  final List<String> sizes;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(24),
              const Text('Size', style: TextStyles.subtitle),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Gap(16),
          Expanded(
            child: ListView.builder(
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                final size = sizes[index];
                final isSelected = selectedSize == size;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.borderColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ListTile(
                    title: Text(
                      size,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check, color: AppColors.whiteColor)
                        : null,
                    onTap: () {
                      onSelected(size);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
