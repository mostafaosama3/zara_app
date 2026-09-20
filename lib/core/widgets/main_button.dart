import 'package:flutter/material.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';

class const MainButton({
    super.key, required this.title, required this.ontap,
  }) extends StatelessWidget {
  final String title;
  final Function ()ontap;
 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ontap, child: Text(title,style: TextStyles.subtitle.copyWith(
      color: AppColors.whiteColor,
    )),
    
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    minimumSize:  const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadiusGeometry.circular(10),
    ),
    ),
    
      );
  }
}