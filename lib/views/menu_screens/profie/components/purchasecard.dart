import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class PurchaseCourseCard extends StatelessWidget {
  final String coursetitle;
  final String lesson;
  final String duration;
  final String img;
  final double value;
  final String number;
  final VoidCallback? onTap;
  const PurchaseCourseCard(
      {super.key,
      required this.coursetitle,
      required this.lesson,
      required this.img,
      required this.duration,
      required this.number,
      required this.value,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 2.w, color: AppColors.primarylightgrey)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(img))),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coursetitle,
                  style: appbartitlestyle,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.activelesson),
                        SizedBox(
                          width: 6.5.w,
                        ),
                        Text(
                          lesson,
                          style: lessonfontt,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(SvgImages.clock),
                        SizedBox(
                          width: 6.5.w,
                        ),
                        Text(
                          duration,
                          style: lessonfontt,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
