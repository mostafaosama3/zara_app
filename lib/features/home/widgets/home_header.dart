import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({required this.onCartTap});

  final VoidCallback onCartTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.borderColor,
          backgroundImage: AssetImage('Assets/images/profile.png'),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Text('Men', style: TextStyle(fontWeight: FontWeight.bold)),
              Gap(10),
             CustomSvgImage(path: AppIcons.arrowdownSvg,height: 10,width: 8,)
            ],
          ),
        ),
        InkWell(
          onTap: onCartTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSvgImage(path: AppIcons.bagSvg,),
            )
          ),
        ),
      ],
    );
  }
}

//class _SearchField extends StatelessWidget {
 // const _SearchField();

 /// @override
  //Widget build(BuildContext context) {
    //return 
     // child: const TextField(
 //
