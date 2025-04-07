import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../utilities/appcolors.dart';

// ignore: must_be_immutable
class Addcoursecard extends StatelessWidget {
  final String title;
  final String lessons;
  final String duration;
  final String name;
  final String price;

  final String img;
  final VoidCallback? ontap;
  const Addcoursecard(
      {super.key,
      required this.title,
      this.ontap,
      required this.lessons,
      required this.duration,
      required this.name,
      required this.img,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border:
                Border.all(width: 1.5.w, color: AppColors.primarylowlightdark)),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 116.h,
                width: 104.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.fallingDot(
                              color: AppColors.primarybrown, size: 25.h),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 16.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titlestyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SvgImages.activelesson),
                            SizedBox(
                              width: 6.5.w,
                            ),
                            Text(
                              lessons,
                              style: lessonfontt,
                            ),
                          ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: NetworkImage(img)),
                              shape: BoxShape.circle),
                        ),
                        Text(
                          name,
                          style: namestyle,
                        ),
                        Row(
                          children: [
                            Text(
                              price,
                              style: pricestyle,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
