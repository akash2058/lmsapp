// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UpcomingTestCard extends StatelessWidget {
  String title;
  String questions;
  String marks;
  String duration;
  String img;
  VoidCallback? onTap;

  UpcomingTestCard(
      {super.key,
      required this.duration,
      required this.title,
      required this.marks,
      required this.img,
      this.onTap,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.16.r),
          border: Border.all(width: 1, color: AppColors.primarylowlightdark),
        ),
        width: 179.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 163.h,
              width: 178.w,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(21.16.r),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      LoadingAnimationWidget.fallingDot(
                          color: AppColors.primarybrown, size: 20.h),
                  imageUrl: img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titlestyle,
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Text(
                    '$questions|$marks|$duration',
                    style: testdetailstyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
