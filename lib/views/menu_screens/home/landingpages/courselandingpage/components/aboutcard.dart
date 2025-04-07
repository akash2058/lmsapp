import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../utilities/textstyle.dart';

// ignore: must_be_immutable
class AboutCourseCard extends StatelessWidget {
  String description;
  AboutCourseCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About the Course',
          style: titlestyle,
        ),
        SizedBox(
          height: 16.h,
        ),
        ReadMoreText(
            lessStyle: appbartitlestyle,
            style: itemsfont,
            removeHtmlTags(description),
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: AppColors.primarybrown,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Show less',
            moreStyle: appbartitlestyle)
      ],
    );
  }
}

String removeHtmlTags(String htmlString) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, '');
}
