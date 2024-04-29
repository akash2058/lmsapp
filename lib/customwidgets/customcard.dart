import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CoursesCard extends StatelessWidget {
  String img;
  String coursetitle;
  String lessons;
  String duration;
  String title;
  String price;
  String discountprice;
  String discount;
  VoidCallback onTap;
  CoursesCard(
      {super.key,
      required this.img,
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
            Container(
              height: 158.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      img,
                    )),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r)),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 12.w, top: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primarywhite),
                      child: Icon(
                        Icons.favorite_border,
                        size: 18.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                      Text(
                        discountprice,
                        style: disountfont,
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
