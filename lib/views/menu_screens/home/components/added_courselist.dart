import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customroute.dart';

import 'package:lmsapp/views/menu_screens/home/components/addcoursecard.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:provider/provider.dart';

class AddedCourseList extends StatelessWidget {
  const AddedCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Column(
          children: List.generate(
              main.home?.data?.recentlyAddedCourse?.length ?? 0, (index) {
            var data = main.home?.data?.recentlyAddedCourse?[index];
            String convertMinutesToHours(int minutes) {
              int hours = minutes ~/ 60;
              int remainingMinutes = minutes % 60;
              String result = '$hours hrs';
              if (remainingMinutes > 0) {
                result += ' $remainingMinutes min';
              }
              return result;
            }

            String? courseTime = main
                .home?.data?.recentlyAddedCourse?[index].courseTime
                .toString();

            // Parse courseTime to int using int.tryParse()
            int? minutes = int.tryParse(courseTime ?? '');

            if (minutes != null) {
            } else {}

            return Column(
              children: [
                CourseCard(
                  ontap: () {
                    Navigator.push(
                        context,
                        CustomPageRoute(
                            child: PopularCourseLandingPage(
                          id: data?.id.toString() ?? '',
                        )));
                  },
                  title: data?.title ?? '',
                  lessons: '${data?.playlistsCount ?? '0'} Lessons',
                  duration: convertMinutesToHours(minutes!.toInt()),
                  name: 'Courtney Henry',
                  price: '₹${data?.coursePrice ?? ''}',
                  img:
                      '${main.home?.data?.baseUrl}/${main.home?.data?.recentlyAddedCourse?[index].image ?? ''}',
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            );
          }),
        );
      },
    );
  }
}
