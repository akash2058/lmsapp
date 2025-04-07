// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PaymentHistoryCard extends StatelessWidget {
  final String coursetitle;
  final String date;
  final String time;
  final String price;
  final bool? loading;
  final String img;
  final VoidCallback? onTap;
  const PaymentHistoryCard(
      {super.key,
      required this.coursetitle,
      required this.date,
      this.loading,
      required this.price,
      required this.img,
      this.onTap,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
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
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.fallingDot(
                              color: AppColors.primarybrown, size: 25.h),
                      fit: BoxFit.cover,
                      imageUrl: img)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coursetitle,
                    style: appbartitlestyle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    '$date $time',
                    style: anotherjakratafont,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: paymentpricestyle,
                      ),
                      Icon(
                        Icons.check_circle,
                        size: 30.h,
                        color: AppColors.secondarygreen,
                      )
                    ],
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
