import 'package:flutter/material.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class AddedCoursesTitle extends StatelessWidget {
  const AddedCoursesTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recently Added Course',
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
