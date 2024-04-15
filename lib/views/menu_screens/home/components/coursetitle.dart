import 'package:flutter/cupertino.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CourseTitle extends StatelessWidget {
  const CourseTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Courses',
          style: titleStyle,
        ),
        Text(
          'See all',
          style: jakratafont,
        )
      ],
    );
  }
}
