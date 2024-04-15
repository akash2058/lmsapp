import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class ReviewCard extends StatelessWidget {
  String studentname;
  String duration;
  String ratings;
  String givereview;
  ReviewCard({
    super.key,
    required this.duration,
    required this.givereview,
    required this.ratings,
    required this.studentname,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.primarywhite,
          border: Border.all(color: AppColors.secondarygrey, width: 0.2.w)),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            CustomTile(
              leading: Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                    color: AppColors.primaryred, shape: BoxShape.circle),
              ),
              title: studentname,
              subtitle: duration,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    size: 14.h,
                    color: AppColors.primaryellow,
                  ),
                  Text(
                    ratings,
                    style: namestyle,
                  ),
                ],
                // ),
              ),
            ),
            Text(
              givereview,
              style: reviewfont,
            )
          ],
        ),
      ),
    );
  }
}
