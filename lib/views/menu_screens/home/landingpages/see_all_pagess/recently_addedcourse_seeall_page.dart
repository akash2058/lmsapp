import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:provider/provider.dart';

import '../../../../../utilities/appcolors.dart';

class SeeAllRecentlyAddedCourse extends StatefulWidget {
  const SeeAllRecentlyAddedCourse({super.key});

  @override
  State<SeeAllRecentlyAddedCourse> createState() =>
      _SeeAllRecentlyAddedCourseState();
}

class _SeeAllRecentlyAddedCourseState extends State<SeeAllRecentlyAddedCourse> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getHomedata();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, state, child) {
        return Scaffold(
          appBar:
              CustomAppbar(autoapply: true, title: 'Recently Added Courses'),
          body: state.loadinghomedata == true
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          state.home?.data?.recentlyAddedCourse?.length ?? 0,
                          (index) {
                        var data =
                            state.home?.data?.recentlyAddedCourse?[index];
                        int coursePrice = data?.coursePrice ?? 0;
                        int salePrice = data?.salePrice ?? 0;

                        double percentage = 0;
                        if (coursePrice > 0 && salePrice > 0) {
                          int discountAmount = coursePrice - salePrice;
                          percentage = (discountAmount / coursePrice) * 100;
                        }
                        String onlypercent = percentage.toStringAsFixed(0);

                        String convertMinutesToHours(int minutes) {
                          int hours = minutes ~/ 60;
                          int remainingMinutes = minutes % 60;
                          String result = '$hours hrs';
                          if (remainingMinutes > 0) {
                            result += ' $remainingMinutes min';
                          }
                          return result;
                        }

                        String? courseTime = state
                            .home?.data?.recentlyAddedCourse?[index].courseTime
                            .toString();

                        // Parse courseTime to int using int.tryParse()
                        int? minutes = int.tryParse(courseTime ?? '');

                        if (minutes != null) {
                          convertMinutesToHours(minutes);
                        } else {}
                        return Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: CoursesCard(
                                img:
                                    '${state.home?.data?.baseUrl}/${data?.image}',
                                coursetitle: data?.category ?? '',
                                lessons:
                                    '${state.home?.data?.recentlyAddedCourse?[index].playlistsCount} Lessons',
                                duration:
                                    convertMinutesToHours(minutes!.toInt()),
                                discount: '${onlypercent}off',
                                discountprice: data?.salePrice.toString() ?? '',
                                price: '₹${data?.coursePrice ?? '0'}',
                                title: state.home?.data
                                        ?.recentlyAddedCourse?[index].title ??
                                    '',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          child: PopularCourseLandingPage(
                                        id: data?.id.toString() ?? '',
                                      )));
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    state.getaddwishlist(
                                        data?.id.toString() ?? '', context);
                                  },
                                  child: Icon(
                                    state.addwishlistpopular == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 22.h,
                                    color: state.addwishlistpopular == true
                                        ? AppColors.primaryred
                                        : AppColors.primaryblack,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        );
                      }),
                    ),
                  )),
        );
      },
    );
  }
}
