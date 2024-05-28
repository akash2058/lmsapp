import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class WishListCard extends StatelessWidget {
  String title;
  String coursetitle;
  String lesson;
  String duration;
  String img;
  VoidCallback? onTap;
  VoidCallback? remove;

  WishListCard(
      {super.key,
      required this.title,
      required this.coursetitle,
      required this.lesson,
      required this.duration,
      required this.img,
      this.remove,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.primarywhite),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 86.h,
              width: 80.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(image: NetworkImage(img))),
            ),
            SizedBox(
              width: 12.w,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: wishlistitle,
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
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          coursetitle,
                          style: coursetitlefont,
                        ),
                        GestureDetector(
                          onTap: remove,
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryred,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.all(6.5.sp),
                              child: Icon(
                                CupertinoIcons.delete,
                                color: AppColors.primarywhite,
                                size: 18.h,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
