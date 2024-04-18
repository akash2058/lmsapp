import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/views/menu_screens/home/components/reviewcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/components/aboutcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/components/lessonlist.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/components/coursedetailcard.dart';

import 'components/landingpagehead.dart';

class PopularCourseLandingPage extends StatelessWidget {
  const PopularCourseLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
        child: Row(
          children: [
            Text(
              '\$40',
              style: titlestyle,
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(child: CustomButton(text: 'Add to Cart', onTap: () {}))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Course Detail', style: appbartitlestyle),
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
                    coursetitle: 'UI/UZ Design',
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
                  LessonLists(),
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
                  CourseReviewList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseReviewList extends StatelessWidget {
  const CourseReviewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => Column(
                children: [
                  ReviewCard(
                      duration: '6 days ago',
                      givereview:
                          "Lyn's straight-talking approach always makes the problem easier to tackle. This session helped me la",
                      ratings: '4.5',
                      studentname: 'Rodolfo Goode',
                      image: AppImages.imgone),
                  SizedBox(
                    height: 16.h,
                  )
                ],
              )),
    );
  }
}
