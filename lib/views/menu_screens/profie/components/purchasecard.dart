import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PurchaseCourseCard extends StatelessWidget {
  final String coursetitle;
  final String lesson;
  final String duration;
  final String img;
  final double value;
  final bool? loading;
  final String number;
  final VoidCallback? onTap;
  const PurchaseCourseCard(
      {super.key,
      required this.coursetitle,
      this.loading,
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
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.fallingDot(
                              color: AppColors.primarybrown, size: 25.h),
                      imageUrl: img)),
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
