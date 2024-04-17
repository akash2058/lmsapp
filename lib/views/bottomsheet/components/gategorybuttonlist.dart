import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class GategoryButtonList extends StatelessWidget {
  const GategoryButtonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.2.w,
                  color: AppColors.primarybrown,
                ),
                color: AppColors.primarybrown,
                borderRadius: BorderRadius.circular(50.r)),
            child: Text(
              'All Course',
              style: gategorybuttonwhite,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.2.w,
                  color: AppColors.primaryblack,
                ),
                color: AppColors.primarywhite,
                borderRadius: BorderRadius.circular(50.r)),
            child: Text(
              'Design',
              style: gategorybuttonblack,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.2.w,
                  color: AppColors.primaryblack,
                ),
                color: AppColors.primarywhite,
                borderRadius: BorderRadius.circular(50.r)),
            child: Text(
              'Development',
              style: gategorybuttonblack,
            ),
          ),
        ],
      ),
    );
  }
}
