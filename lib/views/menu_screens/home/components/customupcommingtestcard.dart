// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class UpcomingTestCard extends StatelessWidget {
  String title;
  String questions;
  String marks;
  String duration;
  String img;
  UpcomingTestCard(
      {super.key,
      required this.duration,
      required this.title,
      required this.marks,
      required this.img,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 179.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 163.h,
            width: 178.w,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.fill, image: AssetImage(img)),
              borderRadius: BorderRadius.circular(21.16.r),
            ),
          ),
          SizedBox(
            height: 8.w,
          ),
          Text(
            title,
            style: titlestyle,
          ),
          SizedBox(
            height: 8.w,
          ),
          Text(
            '$questions|$marks|$duration',
            style: testdetailstyle,
          )
        ],
      ),
    );
  }
}
