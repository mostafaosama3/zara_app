import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';

class ColorOption {
  const ColorOption({required this.name, required this.color});

  final String name;
  final Color color;
}

class ColorBottomSheet {
  static const colors = [
    ColorOption(name: 'Orange', color: AppColors.orangeColor),
    ColorOption(name: 'Black', color: AppColors.blackColor),
    ColorOption(name: 'Red', color: AppColors.redColor),
    ColorOption(name: 'Yellow', color: AppColors.yellowColor),
    ColorOption(name: 'Blue', color: AppColors.blueColor),
    ColorOption(name: 'Green', color: AppColors.greenColor),
    ColorOption(name: 'White', color:AppColors.whiteColor),
    ColorOption(name: 'Brown', color: AppColors.brownColor),
  ];

  static void show({
    required BuildContext context,
    required String selectedColor,
    required ValueChanged<String> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _ColorSheetContent(
        selectedColor: selectedColor,
        onSelected: onSelected,
      ),
    );
  }
}

class _ColorSheetContent extends StatelessWidget {
  const _ColorSheetContent({
    required this.selectedColor,
    required this.onSelected,
  });

  final String selectedColor;
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
              const SizedBox(width: 24),
              const Text(
                'Color',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: ColorBottomSheet.colors.length,
              itemBuilder: (context, index) {
                final colorOption = ColorBottomSheet.colors[index];
                final name = colorOption.name;
                final color = colorOption.color;
                final isSelected = selectedColor == name;
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
                      name,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(backgroundColor: color, radius: 8),
                        if (isSelected) ...[
                          const Gap(8),
                          const Icon(
                            Icons.check,
                            color: AppColors.whiteColor,
                            size: 18,
                          ),
                        ],
                      ],
                    ),
                    onTap: () {
                      onSelected(name);
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
