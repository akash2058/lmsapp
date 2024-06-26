import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';

import '../../../../utilities/appcolors.dart';

// ignore: must_be_immutable
class GuidelineTitles extends StatelessWidget {
  String title;
  GuidelineTitles({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.sp, color: AppColors.bordercolor))),
      child: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Text(
                title,
                style: faqstyle,
              ),
            ),
            const Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }
}
