import 'package:flutter/cupertino.dart';

import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';

import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:provider/provider.dart';

class FeaturedCourse extends StatelessWidget {
  const FeaturedCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Row(
          children: List.generate(main.home?.data?.featuredCourse?.length ?? 0,
              (index) {
            var data = main.home?.data?.featuredCourse?[index];
            int coursePrice = data?.coursePrice ?? 0;
            int salePrice = data?.salePrice ?? 0;

            // Calculate discount amount and percentage
            int discountAmount = coursePrice - salePrice;
            double percentage = (discountAmount / coursePrice) * 100;
            String discountpercent = percentage.toStringAsFixed(0);
            discountpercent =
                discountpercent.substring(0, discountpercent.length - 0);
            String convertMinutesToHours(int minutes) {
              int hours = minutes ~/ 60;
              int remainingMinutes = minutes % 60;
              String result = '$hours hours';
              if (remainingMinutes > 0) {
                result += ' $remainingMinutes minutes';
              }
              return result;
            }

            String? courseTime =
                main.home?.data?.featuredCourse?[index].courseTime.toString();

            // Parse courseTime to int using int.tryParse()
            int? minutes = int.tryParse(courseTime ?? '');

            if (minutes != null) {
              convertMinutesToHours(minutes);
            } else {}
            return CoursesCard(
                img: '${main.home?.data?.baseUrl}/${data?.image}',
                coursetitle: main.home?.data?.featuredCourse?[index].category
                        .toString() ??
                    '',
                lessons:
                    '${main.home?.data?.featuredCourse?[index].playlistsCount} lessons',
                duration: convertMinutesToHours(minutes!.toInt()),
                discount: 'off$discountpercent',
                discountprice: '${data?.salePrice}',
                price:
                    'INR ${main.home?.data?.featuredCourse?[index].coursePrice}',
                onTap: () {
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child: PopularCourseLandingPage(
                        id: data?.id.toString() ?? '',
                      )));
                },
                title: '${data?.title}');
          }),
        );
      },
    );
  }
}
