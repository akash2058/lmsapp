import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customexpansiontile.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/aboutcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/coursedetailcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/coursereviewlist.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/customlessontext.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/landingpages/components/payedcourselist.dart';
import 'package:provider/provider.dart';

class PurchasedCourseLandingPage extends StatefulWidget {
  final String id;
  final String coursename;
  const PurchasedCourseLandingPage(
      {super.key, required this.id, required this.coursename});

  @override
  State<PurchasedCourseLandingPage> createState() =>
      _PurchasedCourseLandingPageState();
}

class _PurchasedCourseLandingPageState
    extends State<PurchasedCourseLandingPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loaddata();
    });
  }

  void loaddata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getMyPlaylist(widget.id);
    print(widget.id);
  }

  int currentstate = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Scaffold(
          bottomNavigationBar: currentstate == 0
              ? null
              : BottomAppBar(
                  elevation: currentstate == 0 ? 0 : 1,
                  child: Column(
                    children: [
                      if (currentstate == 0) const SizedBox(),
                      if (currentstate == 1)
                        CustomButton(
                          height: 53.h,
                          text: 'Confirm',
                          onTap: () {},
                        ),
                      if (currentstate == 2)
                        CustomButton(
                            height: 53.h, text: 'Give Test', onTap: () {})
                    ],
                  ),
                ),
          appBar: CustomAppbar(autoapply: true, title: widget.coursename),
          body: main.loadingmyplaylist == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentstate = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentstate == 0
                                        ? AppColors.primarybrown
                                        : AppColors.primarygrey),
                                color: currentstate == 0
                                    ? AppColors.primarybrown
                                    : AppColors.primarywhite,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 12.w),
                              child: Text(
                                'Play List',
                                style: currentstate == 0
                                    ? popularcoursestyle
                                    : itemsfont,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentstate = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentstate == 1
                                        ? AppColors.primarybrown
                                        : AppColors.primarygrey),
                                color: currentstate == 1
                                    ? AppColors.primarybrown
                                    : AppColors.primarywhite,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 12.w),
                              child: Text(
                                'Course Details',
                                style: currentstate == 1
                                    ? popularcoursestyle
                                    : itemsfont,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentstate = 2;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentstate == 2
                                        ? AppColors.primarybrown
                                        : AppColors.primarygrey),
                                color: currentstate == 2
                                    ? AppColors.primarybrown
                                    : AppColors.primarywhite,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 12.w),
                              child: Text(
                                'Certificates',
                                style: currentstate == 2
                                    ? popularcoursestyle
                                    : itemsfont,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      if (currentstate == 1)
                        Expanded(
                          child: SingleChildScrollView(
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
                                const PayedCourseLandingPage(),
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
                                const CourseReviewList(),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    border: Border.all(
                                                      color: AppColors
                                                          .primarylightgrey,
                                                    )),
                                                child: const Icon(
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
                        ),
                      if (currentstate == 2)
                        Column(
                          children: [
                            SizedBox(
                              height: 175.h,
                            ),
                            Container(
                              height: 140.h,
                              width: 140.w,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(AppImages.notest))),
                            ),
                            Text(
                              'Give Test!',
                              style: onboardtitle,
                            ),
                            Text(
                              'You need to pass test for certificate',
                              style: itemsfont,
                            ),
                          ],
                        ),
                      if (currentstate == 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Lesson 1-22',
                              style: titlestyle,
                            ),
                            Text(
                              '0hrs 0mins',
                              style: itemsfont,
                            )
                          ],
                        ),
                      if (currentstate == 0)
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                                children: List.generate(
                                    main.playlistitem?.data?.playlist?.length ??
                                        0, (index) {
                              var data =
                                  main.playlistitem?.data?.playlist?[index];
                              return CustomExpansionTile(
                                  lessonnum: index.bitLength.toInt().toString(),
                                  duration: data?.timeDuration ?? '',
                                  lessontitle: data?.title ?? '',
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
                                  ]);
                            })),
                          ),
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
