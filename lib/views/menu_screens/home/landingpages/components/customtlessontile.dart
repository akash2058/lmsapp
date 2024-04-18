import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CustomLessonTile extends StatelessWidget {
  String lessonno;
  String lessontitle;
  String duration;
  CustomLessonTile(
      {super.key,
      required this.lessonno,
      required this.duration,
      required this.lessontitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        dense: true,
        title: Text(
          lessontitle,
          style: lessontitlefont,
        ),
        subtitle: Text(
          duration,
          style: itemsfont,
        ),
        leading: Text(
          lessonno,
          style: lessonnumfont,
        ),
        trailing: Container(
          height: 20.h,
          width: 20.w,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primarybrown),
          child: Icon(
            Icons.play_arrow,
            color: AppColors.primarywhite,
            size: 16.h,
          ),
        ),
      ),
    );
  }
}
