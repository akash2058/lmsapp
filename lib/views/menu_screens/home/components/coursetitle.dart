import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CourseTitle extends StatelessWidget {
  String title;
   CourseTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'See all',
            style: jakratafont,
          ),
        )
      ],
    );
  }
}
