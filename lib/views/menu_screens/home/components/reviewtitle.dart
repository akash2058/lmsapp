import 'package:flutter/cupertino.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class StudentReviewsTitle extends StatelessWidget {
  const StudentReviewsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Our Student Reviews',
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

