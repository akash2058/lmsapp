import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/home/components/addcoursecard.dart';

class AddedCourseList extends StatelessWidget {
  const AddedCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Column(
          children: [
            CourseCard(
              title: 'Learning How To Write As A Professional Author',
              lessons: '9 Lessons',
              duration: '78 hrs 30 mins',
              name: 'Courtney Henry',
              price: '150',
              img: AppImages.imgone,
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
