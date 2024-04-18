import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/cart/components/coursecartcard.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondarylight,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Wish List',
          style: appbartitlestyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            Column(
              children: List.generate(
                  4,
                  (index) => Column(
                        children: [
                          WishListCard(
                            title: 'Expert Wireframing for Mobile...',
                            coursetitle: 'Graphic Design',
                            lesson: '9 Lessons',
                            duration: '78 hrs 30 mins',
                            img: AppImages.imgone,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      )),
            ),
            Spacer(),
            CustomButton(
              height: 53.h,
              text: 'Back To HomePage',
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    );
  }
}

class WishListCard extends StatelessWidget {
  String title;
  String coursetitle;
  String lesson;
  String duration;
  String img;
  WishListCard(
      {super.key,
      required this.title,
      required this.coursetitle,
      required this.lesson,
      required this.duration,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: DecorationImage(image: AssetImage(img))),
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
                      Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryred,
                              shape: BoxShape.circle),
                          padding: EdgeInsets.all(6.5.sp),
                          child: Icon(
                            Icons.delete,
                            color: AppColors.primarywhite,
                            size: 18.h,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
