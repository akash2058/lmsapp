import 'package:flutter/cupertino.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class PopularCourseTitle extends StatelessWidget {
  const PopularCourseTitle({
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
