import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CustomTile extends StatelessWidget {
  Widget? leading;
  Widget? trailing;
  String title;
  String subtitle;

  CustomTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.leading,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        minVerticalPadding: 10,
        visualDensity: VisualDensity(horizontal: -4.w, vertical: -4.h),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: leading,
        dense: true,
        title: Text(
          title,
          style: reviewtitlestyle,
        ),
        subtitle: Text(
          subtitle,
          style: normaltextStyle,
        ),
        trailing: trailing);
  }
}
