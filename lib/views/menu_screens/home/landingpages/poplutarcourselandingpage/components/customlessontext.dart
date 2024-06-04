// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class Customlessontext extends StatelessWidget {
  VoidCallback? ontap;
  String title;
  Customlessontext({super.key, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
          SizedBox(
            width: 12.w,
          ),
          Flexible(
            child: GestureDetector(
              onTap: ontap,
              child: Text(
                title,
                style: Linethroughtbrowntyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Customlessondetails extends StatelessWidget {
  String title;
  Customlessondetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.h,
            width: 20.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primarywhite),
            child: Icon(
              Icons.file_copy,
              color: AppColors.primarygrey,
              size: 16.h,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Flexible(
            child: Text(
              title,
              style: Linethroughtgreystyle,
            ),
          ),
        ],
      ),
    );
  }
}
