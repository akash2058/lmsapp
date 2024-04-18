import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primarybrown),
          child: Icon(
            Icons.play_arrow,
            color: AppColors.primarywhite,
          ),
        ),
      ),
    );
  }
}
