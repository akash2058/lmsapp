import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customexpansiontile.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/aboutcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/coursedetailcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/coursereviewlist.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/customlessontext.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/landingpagehead.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/lessonlist.dart';
import 'package:lmsapp/views/menu_screens/profie/profilepages/landingpages/components/payedcourselist.dart';

class PaymentCourseLandingPage extends StatelessWidget {
  const PaymentCourseLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Course title',
        actions: [
          Icon(Icons.more_horiz),
          SizedBox(
            width: 28.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            const LandingPageHead(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseDetailCard(
                    coursetitle: 'UI/UX Design',
                    title: 'Expert Wireframing for Mobile Design',
                    duration: '4h 24m',
                    lessons: '4 lessons',
                    name: 'Jerremy Mamika',
                    ratings: '4.5',
                    img: AppImages.imgone,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AboutCourseCard(
                    description:
                        'Learn What It Takes to Code Dynamic, Professional Websites and Web Apps From The...Read more Learn What It Takes to Code Dynamic, Professional Websites and Web Apps From The Learn What It Takes to Code Dynamic, Professional Websites and Web Apps From The.',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Lessons',
                    style: titlestyle,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Please finish the lessons step by step',
                    style: itemsfont,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  PayedCourseLandingPage(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Review',
                    style: titlestyle,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CourseReviewList(),
                  Text(
                    'Overall rating',
                    style: titlestyle,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: List.generate(
                        5,
                        (index) => Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      border: Border.all(
                                        color: AppColors.primarylightgrey,
                                      )),
                                  child: Icon(
                                    Icons.star,
                                    color: AppColors.primaryellow,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                )
                              ],
                            )),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'click to rate',
                    style: ratingtextstyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Product Review',
                    style: titlestyle,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomFormField(
                      maxlines: 3,
                      hint:
                          'Would you like to write anything about this course.'),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomButton(
                      width: 122.w,
                      height: 53.h,
                      text: 'Post Review',
                      onTap: () {}),
                  SizedBox(
                    height: 32.h,
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
