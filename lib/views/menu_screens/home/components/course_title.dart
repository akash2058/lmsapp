import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CourseTitle extends StatelessWidget {
  String title;
  VoidCallback? onpressed;
  CourseTitle({super.key, this.onpressed, required this.title});

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
          onTap: onpressed,
          child: Text(
            'See all',
            style: jakratafont,
          ),
        )
      ],
    );
  }
}
