import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class SearchByRatings extends StatelessWidget {
  const SearchByRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.primarygrey,
              )),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.primaryellow,
                size: 16.h,
              ),
              Text(
                '5',
                style: jakratafontblack,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.primarygrey,
              )),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.primaryellow,
                size: 16.h,
              ),
              Text(
                '4',
                style: jakratafontblack,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.primarygrey,
              )),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.primaryellow,
                size: 16.h,
              ),
              Text(
                '3',
                style: jakratafontblack,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.primarygrey,
              )),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.primaryellow,
                size: 16.h,
              ),
              Text(
                '2',
                style: jakratafontblack,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.primarygrey,
              )),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.primaryellow,
                size: 16.h,
              ),
              Text(
                '1',
                style: jakratafontblack,
              )
            ],
          ),
        ),
      ],
    );
  }
}
