import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
class const CustomTextfield({
    super.key, this.title, required this.hintText, this.prefixicon, this.validator,
  }) extends StatelessWidget {
  final String? title;
  final String hintText;
  final Icon? prefixicon;
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        if(title!=null)...[
        Text(title!,style: TextStyles.body.copyWith(fontWeight: .w600)),
        Gap(8),],
        TextFormField(
          validator:validator ,
         decoration: InputDecoration(
          prefixIcon: prefixicon,
       hintText: hintText,
       hintStyle: TextStyle(
        color: AppColors.blackColor,
       )
        ),
        
         ),
        
      ],
    );
  }
}