import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            Row(
              children: [
                CustomSearchField(
                  prefix: SvgPicture.asset(
                    SvgImages.search,
                    height: 24.h,
                  ),
                  hint: 'Search any thing',
                ),
                CircleAvatar(
                  backgroundColor: AppColors.secondarylight,
                  child: Padding(
                    padding: EdgeInsets.all(18.sp),
                    child: SvgPicture.asset(
                      SvgImages.bottomsheetimg,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Container(
              height: 170.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(colors: [
                    AppColors.primaryacent,
                    AppColors.primarybrown
                  ])),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Course',
                      style: allcoursefont,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Art & Illustration',
                      style: allCoursetitle,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      '20/25 Lesson',
                      style: lessonfont,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    CustomSmallButton(
                        height: 28.h,
                        backgroudcolor: AppColors.primarybrown,
                        text: 'Search',
                        onTap: () {})
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Row(
                    children: [
                      Container(
                        height: 8.h,
                        width: 8.w,
                        decoration: BoxDecoration(
                            color: AppColors.primarybrown,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 5.w,
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Courses',
                  style: titleStyle,
                ),
                Text(
                  'See all',
                  style: jakratafont,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomSearchField extends StatelessWidget {
  String hint;
  Widget? prefix;
  Widget? suffix;
  CustomSearchField({super.key, required this.hint, this.prefix, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 1,
        color: AppColors.secondarylight,
        child: TextFormField(
          style: hintstyle,
          decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minWidth: 56.w),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              isDense: true,
              hintStyle: hintstyle,
              prefixIcon: prefix,
              suffix: suffix,
              hintText: hint,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
