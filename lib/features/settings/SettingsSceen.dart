import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/features/auth/pages/sign_in_screen.dart';
import 'package:zara_app/features/settings/wishlist_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const Gap(50),
              // Profile Image
              Center(
                child:
                 CircleAvatar
                 (
                  radius: 50,
                  child:
                   ClipOval(child: Image.network("https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR0NRi3YLt-O7IdyjcroPZnWk9E7X7_Pzjpt7TLpsxjzAw14IQh",width: 100,height: 100,fit: BoxFit.cover,))
                   ),
                   ),
              const Gap(24),

              // User Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gilbert Jones',
                          style: TextStyles.body.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          'Gilbertjones001@gmail.com',
                          style: TextStyles.caption1.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          '121-224-7890',
                          style: TextStyles.caption1.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Edit',
                        style: TextStyles.body.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),

              // Settings Options List
              _buildSettingOption(
                title: 'Wishlist',
                onTap: () {
                  pushTo(context, WishlistScreen());
                },
              ),
              const Gap(8),
              _buildSettingOption(
                title: 'Help',
                onTap: () {},
              ),
              const Gap(8),
              _buildSettingOption(
                title: 'Support',
                onTap: () {},
              ),

              const Gap(200),

              // Sign Out Button
              TextButton(
                onPressed: () {
                  pushReplacement(context, SignInScreen());
                },
                child: Text(
                  'Sign Out',
                  style: TextStyles.body.copyWith(
                    color: AppColors.redColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: TextStyles.body.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomSvgImage(path:AppIcons.arrowrightSvg,color: AppColors.blackColor,width:25,height:25),
        )
      ),
    );
  }
}