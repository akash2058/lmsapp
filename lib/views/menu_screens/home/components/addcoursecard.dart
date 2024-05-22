import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

import '../../../../utilities/appcolors.dart';

// ignore: must_be_immutable
class CourseCard extends StatelessWidget {
  String title;
  String lessons;
  String duration;
  String name;
  String price;
  String img;
  VoidCallback? ontap;
  CourseCard(
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(img)),
                    borderRadius: BorderRadius.circular(8.r)),
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
