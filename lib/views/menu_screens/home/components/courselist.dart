import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:provider/provider.dart';

class PopularCourseList extends StatelessWidget {
  const PopularCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return SingleChildScrollView(
          child: Row(
            children: List.generate(main.home?.data?.popularCourse?.length ?? 0,
                (index) {
              var data = main.home?.data?.popularCourse?[index];
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

              String? courseTime =
                  main.home?.data?.popularCourse?[index].courseTime.toString();

              // Parse courseTime to int using int.tryParse()
              int? minutes = int.tryParse(courseTime ?? '');

              if (minutes != null) {
                convertMinutesToHours(minutes);
              } else {}
              return CoursesCard(
                img: '${main.home?.data?.baseUrl}/${data?.image}',
                coursetitle: data?.category ?? '',
                lessons:
                    '${main.home?.data?.featuredCourse?[index].playlistsCount} Lessons',
                duration: convertMinutesToHours(minutes!.toInt()),
                discount: 'off $onlypercent',
                discountprice: '5000',
                price:
                    '₹${main.home?.data?.popularCourse?[index].coursePrice ?? ''}',
                title: main.home?.data?.popularCourse?[index].title ?? '',
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
                    main.getaddwishlist(data?.id.toString() ?? '', context);
                  },
                  child: Icon(
                    main.addwishlistpopular == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 22.h,
                    color: main.addwishlistpopular == true
                        ? AppColors.primaryred
                        : AppColors.primaryblack,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
