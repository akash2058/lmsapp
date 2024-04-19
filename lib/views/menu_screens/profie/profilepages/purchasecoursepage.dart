
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/profie/components/purchasecard.dart';

class PurchaseCoursePage extends StatelessWidget {
  const PurchaseCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Purchase History',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      gradient: const LinearGradient(colors: [
                        AppColors.primaryacent,
                        AppColors.primarybrown,
                      ])),
                  child: Text(
                    'My Course',
                    style: gategorybuttonwhite,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      gradient: const LinearGradient(colors: [
                        AppColors.primaryacent,
                        AppColors.primarybrown,
                      ])),
                  child: Text(
                    'My Course',
                    style: gategorybuttonwhite,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            PurchaseCourseCard(
              coursetitle: 'UI/UX Designer',
              lesson: '9 Lessons',
              img: AppImages.imgone,
              duration: '9h 29min',
              number: '18',
              value: 0.6,
            )
          ],
        ),
      ),
    );
  }
}
