import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';

class LandingPageHead extends StatelessWidget {
  const LandingPageHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppImages.cardback))),
      child: Center(
        child: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primarybrown),
          child: Icon(
            Icons.play_arrow,
            color: AppColors.primarywhite,
            size: 18.h,
          ),
        ),
      ),
    );
  }
}
