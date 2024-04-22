import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customexpansiontile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/customlessontext.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/customtlessontile.dart';

class PurchasedCourseLandingPage extends StatelessWidget {
  const PurchasedCourseLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'UI/UX Designer'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                3,
                (index) => Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primarybrown,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.w),
                      child: Text(
                        'Course Details',
                        style: popularcoursestyle,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    )
                  ],
                ),
              )),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lesson 1-22',
                  style: titlestyle,
                ),
                Text(
                  '2hr 30min',
                  style: itemsfont,
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(
                        7,
                        (index) => CustomExpansionTile(
                                lessonnum: '02',
                                duration: '5min 34s',
                                lessontitle: 'Introducing to The Class',
                                children: [
                                  Customlessontext(
                                    title:
                                        'Course Introduction - AWS Certified Solutions Architect Associate',
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Customlessondetails(
                                      title:
                                          'Please Read Lectures carefully Please Read Lectures carefullyPlease Read Lectures carefully'),
                                ]))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
