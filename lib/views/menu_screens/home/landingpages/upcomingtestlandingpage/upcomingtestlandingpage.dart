import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class UpComingTestLandingpage extends StatelessWidget {
  const UpComingTestLandingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'UI/UX Designer'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Test Series',
              style: titleStyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            TestLists(),
            SizedBox(
              height: 20.h,
            ),
            LatestQuizetitle(),
            SizedBox(
              height: 20.h,
            ),
            QuizCard(),
            SizedBox(
              height: 20.h,
            ),
            QuizCard(),
            SizedBox(
              height: 20.h,
            ),
            QuizCard(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 1.sp,
          color: AppColors.primarygrey,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UI/UX Design',
                style: titlestyle,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                '10 Questions | 20 Marks | 10 Mins',
                style: itemsfont,
              )
            ],
          ),
          CustomSmallButton(
              backgroudcolor: AppColors.primarybrown,
              textcolor: AppColors.primarywhite,
              text: 'Start',
              onTap: () {})
        ],
      ),
    );
  }
}

class LatestQuizetitle extends StatelessWidget {
  const LatestQuizetitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Latest Quizes',
          style: titleStyle,
        ),
        Text(
          'See all',
          style: pricestyle,
        )
      ],
    );
  }
}

class TestLists extends StatelessWidget {
  const TestLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            3,
            (index) => Row(
                  children: [
                    TestCard(
                      testtitle: 'Mockup Test',
                      duration: '0',
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                  ],
                )),
      ),
    );
  }
}

class TestCard extends StatelessWidget {
  String testtitle;
  String duration;
  TestCard({super.key, required this.testtitle, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112.61.w,
      padding: EdgeInsets.symmetric(horizontal: 15.18.w, vertical: 18.98.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 1.5.w, color: AppColors.primarygrey),
      ),
      child: Column(
        children: [
          Container(
            height: 74.h,
            width: 74.w,
            decoration: BoxDecoration(
                color: AppColors.formfillcolor, shape: BoxShape.circle),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            textAlign: TextAlign.center,
            testtitle,
            style: testtitlestyle,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            '${duration}/20',
            style: testnumberstyle,
          )
        ],
      ),
    );
  }
}