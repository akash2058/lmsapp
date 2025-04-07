import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CoursesCard extends StatelessWidget {
  final String img;

  final Widget? child;
  final String coursetitle;
  final String lessons;
  final String duration;
  final String title;
  final String price;
  final String discountprice;
  final String discount;
  final VoidCallback onTap;
  const CoursesCard(
      {super.key,
      required this.img,
      this.child,
      required this.coursetitle,
      required this.lessons,
      required this.duration,
      required this.discount,
      required this.discountprice,
      required this.price,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280.w,
        decoration: BoxDecoration(
            border:
                Border.all(width: 1.w, color: AppColors.primarylowlightdark),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.inkDrop(
                              color: AppColors.primarybrown, size: 20.h),
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.fill,
                      imageUrl: img,
                      height: 158.h,
                    ),
                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: Container(
                        child: child,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coursetitle,
                    style: coursetitlefont,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImages.activelesson,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 4.5.w,
                      ),
                      Text(
                        lessons,
                        style: lessonfontt,
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgImages.clock,
                            height: 18.h,
                          ),
                          SizedBox(
                            width: 4.5.w,
                          ),
                          Text(
                            duration,
                            style: lessonfontt,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    title,
                    style: titlestyle,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: pricefont,
                      ),
                      Flexible(
                        child: Text(
                          discountprice,
                          style: disountfont,
                        ),
                      ),
                      Text(
                        discount,
                        style: courseprice,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
