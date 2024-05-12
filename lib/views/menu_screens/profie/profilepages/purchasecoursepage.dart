import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/home/components/custom_upcomming_testcard.dart';
import 'package:lmsapp/views/menu_screens/profie/components/purchasecard.dart';
import 'package:lmsapp/views/menu_screens/profie/profilepages/landingpages/purchasedcourselandingpage.dart';

class PurchaseCoursePage extends StatefulWidget {
  const PurchaseCoursePage({super.key});

  @override
  State<PurchaseCoursePage> createState() => _PurchaseCoursePageState();
}

class _PurchaseCoursePageState extends State<PurchaseCoursePage> {
  int currentstate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        autoapply: true,
        title: 'Purchase History',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentstate = 0;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: currentstate == 0
                              ? AppColors.primarybrown
                              : AppColors.primarylightgrey),
                      color: currentstate == 0
                          ? AppColors.primarybrown
                          : AppColors.primarywhite,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Text(
                      'My Course',
                      style: currentstate == 0
                          ? gategorybuttonwhite
                          : gategorybuttonblack,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentstate = 1;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: currentstate == 1
                              ? AppColors.primarybrown
                              : AppColors.primarylightgrey),
                      borderRadius: BorderRadius.circular(50.r),
                      color: currentstate == 1
                          ? AppColors.primarybrown
                          : AppColors.primarywhite,
                    ),
                    child: Text(
                      'UpComing Test',
                      style: currentstate == 1
                          ? gategorybuttonwhite
                          : gategorybuttonblack,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            if (currentstate == 0)
              PurchaseCourseCard(
                onTap: () {
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child: const PurchasedCourseLandingPage()));
                },
                coursetitle: 'UI/UX Designer',
                lesson: '9 Lessons',
                img: AppImages.imgone,
                duration: '9h 29min',
                number: '18',
                value: 0.6,
              ),
            if (currentstate == 1)
              Expanded(
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 14.h,
                        childAspectRatio: 0.65,
                        crossAxisCount: 2,
                        crossAxisSpacing: 14.w),
                    itemBuilder: (context, index) {
                      return UpcomingTestCard(
                          duration: '10 Mins',
                          title: 'UI/UX Design',
                          marks: '20 Marks',
                          img: AppImages.uiuximg,
                          questions: '10 Questions');
                    }),
              )
          ],
        ),
      ),
    );
  }
}
