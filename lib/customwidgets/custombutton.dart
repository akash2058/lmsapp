import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
  CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(colors: [
              AppColors.primarybrown,
              AppColors.secondarybrown,
              AppColors.primaryacent
            ])),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 21.h),
          child: Center(
            child: Text(
              text,
              style: buttonstyle,
            ),
          ),
        ),
      ),
    );
  }
}
