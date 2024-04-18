import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
  double? height;
  double? width;
  CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: const LinearGradient(colors: [
              AppColors.primarybrown,
              AppColors.secondarybrown,
              AppColors.primaryacent
            ])),
        child: Center(
          child: Text(
            text,
            style: buttonstyle,
          ),
        ),
      ),
    );
  }
}
