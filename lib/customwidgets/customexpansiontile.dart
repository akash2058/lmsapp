import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomExpansionTile extends StatelessWidget {
  String lessontitle;
  String duration;
  String lessonnum;
  Widget? leading;
  Widget? trailing;
  List<Widget> children;

  CustomExpansionTile({
    Key? key,
    this.leading,
    this.trailing,
    required this.lessonnum,
    required this.duration,
    required this.lessontitle,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        childrenPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        iconColor: AppColors.primarybrown,
        leading: Text(
          lessonnum,
          style: lessonnumfont,
        ),
        dense: true,
        subtitle: Text(
          duration,
          style: itemsfont,
        ),
        title: Text(
          lessontitle,
          style: lessontitlefont,
        ),
        children: children,
      ),
    );
  }
}
