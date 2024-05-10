import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lmsapp/views/menu_screens/home/components/addcoursecard.dart';
import 'package:lmsapp/views/menucard/main_menu_providers.dart';
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
            return Column(
              children: [
                CourseCard(
                  title: main.home?.data?.recentlyAddedCourse?[index].title
                          .toString() ??
                      '',
                  lessons: '9 Lessons',
                  duration:
                      '${main.home?.data?.recentlyAddedCourse?[index].courseTime ?? ''} min',
                  name: 'Courtney Henry',
                  price: main
                          .home?.data?.recentlyAddedCourse?[index].coursePrice
                          .toString() ??
                      '',
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
