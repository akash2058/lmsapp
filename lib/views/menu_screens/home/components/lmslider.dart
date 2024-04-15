import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class LmsSlider extends StatelessWidget {
  const LmsSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: const LinearGradient(
              colors: [AppColors.primaryacent, AppColors.primarybrown])),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Course',
              style: allcoursefont,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'Art & Illustration',
              style: allCoursetitle,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              '20/25 Lesson',
              style: lessonfont,
            ),
            SizedBox(
              height: 28.h,
            ),
            CustomSmallButton(
                height: 28.h,
                textcolor: AppColors.primarywhite,
                backgroudcolor: AppColors.primarybrown,
                text: 'Search',
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
