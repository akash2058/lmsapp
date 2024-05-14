import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customsearch.dart';

import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/bottom_sheet/lmsbottomsheet.dart';
import 'package:lmsapp/views/drawer/lms_drawer.dart';

import 'package:lmsapp/views/menu_screens/home/components/added_courselist.dart';

import 'package:lmsapp/views/menu_screens/home/components/courselist.dart';
import 'package:lmsapp/views/menu_screens/home/components/course_title.dart';

import 'package:lmsapp/views/menu_screens/home/components/lms_slider.dart';

import 'package:lmsapp/views/menu_screens/home/components/review_list.dart';

import 'package:lmsapp/views/menu_screens/home/components/slider_indicator.dart';

import 'package:lmsapp/views/menu_screens/home/components/upcoming_testlist.dart';
import 'package:lmsapp/views/menu_screens/home/searchscreen.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/notification/lms_notification.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homedata();
    });
  }

  void homedata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    var auth = Provider.of<AuthenticationProvider>(context, listen: false);
    await state.getHomedata(auth.user?.data?.token);
  }

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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, CustomPageRoute(child: const LmsNotifcation()));
                },
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 11.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primarylightgrey)),
                    child: SvgPicture.asset(
                      SvgImages.notifi,
                      height: 24.h,
                    )),
              ),
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
          body: main.loadinghomedata == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primarybrown,
                ))
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomSearchField(
                              onTap: () {
                                Navigator.push(context,
                                    CustomPageRoute(child: MySearchScreen()));
                              },
                              prefix: SvgPicture.asset(
                                SvgImages.search,
                                height: 24.h,
                              ),
                              hint: 'Search any thing',
                            ),
                            SizedBox(
                              width: 20.w,
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
                        CourseTitle(
                          title: 'Popular Courses',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                main.home?.data?.category?.length ?? 0,
                                (index) => Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          gradient: const LinearGradient(
                                              colors: [
                                                AppColors.primarybrown,
                                                AppColors.secondarybrown,
                                                AppColors.primaryacent
                                              ])),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 12.w),
                                      child: Text(
                                        main.home?.data?.category?[index].title
                                                .toString() ??
                                            '',
                                        style: popularcoursestyle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    )
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const PopularCourseList(),
                        SizedBox(
                          height: 15.h,
                        ),
                        CourseTitle(
                          title: 'Recently Added Courses',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const AddedCourseList(),
                        SizedBox(
                          height: 32.h,
                        ),
                        CourseTitle(
                          title: 'Featured Courses',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const FeaturedCourse(),
                        SizedBox(
                          height: 32.h,
                        ),
                        CourseTitle(
                          title: 'Our Student Reviews',
                        ),
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

