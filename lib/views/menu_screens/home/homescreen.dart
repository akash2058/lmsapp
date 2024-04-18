import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customsearch.dart';

import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/bottomsheet/lmsbottomsheet.dart';
import 'package:lmsapp/views/drawer/lmsdrawer.dart';

import 'package:lmsapp/views/menu_screens/home/components/addedcourselist.dart';
import 'package:lmsapp/views/menu_screens/home/components/addedcoursetitle.dart';
import 'package:lmsapp/views/menu_screens/home/components/courselist.dart';
import 'package:lmsapp/views/menu_screens/home/components/coursetitle.dart';

import 'package:lmsapp/views/menu_screens/home/components/lmslider.dart';

import 'package:lmsapp/views/menu_screens/home/components/reviewlist.dart';
import 'package:lmsapp/views/menu_screens/home/components/reviewtitle.dart';
import 'package:lmsapp/views/menu_screens/home/components/sliderindicator.dart';
import 'package:lmsapp/views/menu_screens/home/components/upcomingtestitle.dart';
import 'package:lmsapp/views/menu_screens/home/components/upcomingtestlist.dart';
import 'package:lmsapp/views/menucard/main_menu_providers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Scaffold(
          backgroundColor: AppColors.lightwhite,
          drawer: const LmsDrawer(),
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Image.asset(
                AppImages.applogo,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 11.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primarylightgrey)),
                  child: SvgPicture.asset(
                    SvgImages.notifi,
                    height: 24.h,
                  )),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 11.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.primarylightgrey)),
                      child: Icon(
                        Icons.menu,
                        size: 24.h,
                        color: AppColors.primarygrey,
                      )),
                );
              }),
              SizedBox(
                width: 28.w,
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      GestureDetector(
                        onTap: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) {
                                return const LmsBottomSheet();
                              });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primarylightgrey),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 16.w),
                            child: SvgPicture.asset(
                              SvgImages.bottomsheetimg,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  const LmsSlider(),
                  SizedBox(
                    height: 12.h,
                  ),
                  const SliderIndicator(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const PopularCourseTitle(),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              gradient: const LinearGradient(colors: [
                                AppColors.primarybrown,
                                AppColors.secondarybrown,
                                AppColors.primaryacent
                              ])),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 12.w),
                          child: Text(
                            'All Course',
                            style: anotherjakratafont,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              gradient: const LinearGradient(colors: [
                                AppColors.primarybrown,
                                AppColors.secondarybrown,
                                AppColors.primaryacent
                              ])),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 12.w),
                          child: Text(
                            'Computer Networking',
                            style: anotherjakratafont,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              gradient: const LinearGradient(colors: [
                                AppColors.primarybrown,
                                AppColors.secondarybrown,
                                AppColors.primaryacent
                              ])),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 12.w),
                          child: Text(
                            'Networking',
                            style: anotherjakratafont,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const PopularCourseList(),
                  SizedBox(
                    height: 15.h,
                  ),
                  const AddedCoursesTitle(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const AddedCourseList(),
                  SizedBox(
                    height: 32.h,
                  ),
                  const UpComingTestTitle(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const UpComingTestList(),
                  SizedBox(
                    height: 32.h,
                  ),
                  const StudentReviewsTitle(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ReviewList(),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Social Links',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: List.generate(
                        main.socialimges.length,
                        (index) => Row(
                              children: [
                                Image.asset(
                                  main.socialimges[index],
                                  height: 41.h,
                                ),
                                SizedBox(
                                  width: 9.6.w,
                                )
                              ],
                            )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}






// ignore: must_be_immutable







// ignore: must_be_immutable

