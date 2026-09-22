import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/main_button.dart';

class TellUsAboutYourselfScreen extends StatefulWidget {
  const TellUsAboutYourselfScreen({super.key});

  @override
  State<TellUsAboutYourselfScreen> createState() =>
      _TellUsAboutYourselfScreenState();
}

class _TellUsAboutYourselfScreenState
    extends State<TellUsAboutYourselfScreen> {
  String selectedGender = 'Men';
  String? selectedAge;

  final List<String> ageRanges = [
    '18 - 24',
    '25 - 34',
    '35 - 44',
    '45 - 54',
    '55+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(120),

              Text(
                'Tell us About yourself',
                style: TextStyles.headline2.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Gap(35),

              Text(
                'Who do you shop for ?',
                style: TextStyles.subtitle.copyWith(
                  color: AppColors.blackColor,
                ),
              ),

              const Gap(14),

              Row(
                children: [
                  Expanded(
                    child: _GenderButton(
                      title: 'Men',
                      isSelected: selectedGender == 'Men',
                      onTap: () {
                        setState(() {
                          selectedGender = 'Men';
                        });
                      },
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: _GenderButton(
                      title: 'Women',
                      isSelected: selectedGender == 'Women',
                      onTap: () {
                        setState(() {
                          selectedGender = 'Women';
                        });
                      },
                    ),
                  ),
                ],
              ),

              const Gap(30),

              Text(
                'How Old are you ?',
                style: TextStyles.body.copyWith(
                  color: AppColors.blackColor,
                    fontWeight: .w500,
                ),
              ),

              const Gap(14),

              DropdownButtonFormField<String>(
                initialValue: selectedAge,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.accentColor,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: Text(
                  'Age Range',
                  style: TextStyles.body.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                icon: const Icon(
                  Iconsax.arrow_down_1_copy,
                  color: AppColors.blackColor,
                ),
                items: ageRanges.map((age) {
                  return DropdownMenuItem<String>(
                    value: age,
                    child: Text(
                      age,
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAge = value;
                  });
                },
              ),

              const Spacer(),

              MainButton(
                title: 'Finish',
                ontap: () {},
              ),

              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected
              ? AppColors.primaryColor
              : AppColors.accentColor,
          foregroundColor: isSelected
              ? AppColors.whiteColor
              : AppColors.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          title,
          style: TextStyles.body.copyWith(
            color: isSelected
                ? AppColors.whiteColor
                : AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}