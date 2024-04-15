import 'package:flutter/material.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class UpComingTestTitle extends StatelessWidget {
  const UpComingTestTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Up Coming Test',
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