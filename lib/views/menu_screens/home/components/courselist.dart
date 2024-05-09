import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:lmsapp/views/menucard/main_menu_providers.dart';
import 'package:provider/provider.dart';

class PopularCourseList extends StatelessWidget {
  const PopularCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return SizedBox(
          height: 288.h,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: main.home?.data?.featuredCourse?.length ?? 0,
            itemBuilder: (context, index) {
              var data = main.home?.data?.popularCourse?[index];
              // Ensure coursePrice and salePrice are non-nullable
              int coursePrice = data?.coursePrice ?? 0;
              int salePrice = data?.salePrice ?? 0;

              // Calculate discount amount and percentage
              int discountAmount = coursePrice - salePrice;
              double percentage = (discountAmount / coursePrice) * 100;

              return CoursesCard(
                img: '${main.home?.data?.baseUrl}/${data?.image}',
                coursetitle: data?.category ?? '',
                lessons:
                    '${main.home?.data?.featuredCourse?[index].playlistsCount} Lessons',
                duration:
                    '${main.home?.data?.popularCourse?[index].courseTime ?? ''} min',
                discount: '${percentage}% OFF',
                discountprice: '5000',
                price:
                    'INR${main.home?.data?.popularCourse?[index].coursePrice ?? ''}',
                title: main.home?.data?.popularCourse?[index].title ?? '',
                onTap: () {
                  Navigator.push(context,
                      CustomPageRoute(child: const PopularCourseLandingPage()));
                },
              );
            },
          ),
        );
      },
    );
  }
}
