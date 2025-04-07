import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/courselandingpage/courselandingpage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class AddedCourseList extends StatelessWidget {
  const AddedCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        var recentlyAddedCourses = main.home?.data?.recentlyAddedCourse;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              recentlyAddedCourses?.length ?? 0,
              (index) {
                var data = recentlyAddedCourses?[index];

                String convertMinutesToHours(int minutes) {
                  int hours = minutes ~/ 60;
                  int remainingMinutes = minutes % 60;
                  String result = '$hours hrs';
                  if (remainingMinutes > 0) {
                    result += ' $remainingMinutes min';
                  }
                  return result;
                }

                int coursePrice = data?.coursePrice ?? 0;
                int salePrice = data?.salePrice ?? 0;
                double percentage = 0;

                if (coursePrice > 0 && salePrice > 0) {
                  int discountAmount = coursePrice - salePrice;
                  percentage = (discountAmount / coursePrice) * 100;
                }

                String onlypercent = percentage.toStringAsFixed(0);
                String? courseTime = recentlyAddedCourses != null &&
                        index < recentlyAddedCourses.length
                    ? recentlyAddedCourses[index].courseTime.toString()
                    : null;

                int? minutes = int.tryParse(courseTime ?? '');

                return Row(
                  children: [
                    CoursesCard(
                      img: '${main.home?.data?.baseUrl}/${data?.image ?? ''}',
                      coursetitle: data?.category ?? '',
                      lessons: '${data?.playlistsCount ?? '0'} Lessons',
                      duration: minutes != null
                          ? convertMinutesToHours(minutes)
                          : 'N/A',
                      discount: '$onlypercent% off',
                      discountprice: '${data?.coursePrice ?? ''}',
                      price: '₹${data?.salePrice ?? ''}',
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            child: CourseLandingPage(
                              id: data?.id.toString() ?? '',
                            ),
                          ),
                        );
                      },
                      title: data?.title ?? '',
                      child: GestureDetector(
                        onTap: () {
                          main.getaddwishlist(
                              data?.id.toString() ?? '', context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                              color: AppColors.primarylightgrey,
                              shape: BoxShape.circle),
                          child: main.loadingaddwishlist == true
                              ? LoadingAnimationWidget.beat(
                                  color: AppColors.primarybrown, size: 22.h)
                              : Icon(
                                  main.wishlistRecentStatus[
                                              data?.id.toString()] ==
                                          true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 22.h,
                                  color: main.wishlistRecentStatus[
                                              data?.id.toString()] ==
                                          true
                                      ? AppColors.primaryred
                                      : AppColors.primaryblack,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.h),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}


//  Addcoursecard(
                
//                   ontap: () {
                   
//                   },
//                   title: data?.title ?? '',
//                   lessons: '${data?.playlistsCount ?? '0'} Lessons',
//                   duration: convertMinutesToHours(minutes!.toInt()),
//                   name: 'Courtney Henry',
//                   price: ,
//                   img:
//                       '${main.home?.data?.baseUrl}/${main.home?.data?.recentlyAddedCourse?[index].image ?? ''}',
//                 ),