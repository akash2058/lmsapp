import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:provider/provider.dart';

class PopularCourseSeeAll extends StatefulWidget {
  const PopularCourseSeeAll({super.key});

  @override
  State<PopularCourseSeeAll> createState() => _PopularCourseSeeAllState();
}

class _PopularCourseSeeAllState extends State<PopularCourseSeeAll> {
  @override
  void initState() {
    super.initState();
    allcoursedata();
  }

  void allcoursedata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getHomedata();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(builder: (context, state, child) {
      return Scaffold(
        appBar: CustomAppbar(autoapply: true, title: 'All Popular Courses'),
        body: state.loadinghomedata == true
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        state.home?.data?.popularCourse?.length ?? 0, (index) {
                      var data = state.home?.data?.popularCourse?[index];
                      int coursePrice = data?.coursePrice ?? 0;
                      int salePrice = data?.salePrice ?? 0;

                      int discountAmount = coursePrice - salePrice;
                      double percentage = (discountAmount / coursePrice) * 100;
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
                          .home?.data?.popularCourse?[index].courseTime
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
                                  '${state.home?.data?.popularCourse?[index].playlistsCount} Lessons',
                              duration: convertMinutesToHours(minutes!.toInt()),
                              discount: 'off $onlypercent',
                              discountprice: '5000',
                              price:
                                  '₹${state.home?.data?.popularCourse?[index].coursePrice ?? ''}',
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
    });
  }
}
