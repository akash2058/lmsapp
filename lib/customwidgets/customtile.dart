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
        visualDensity: VisualDensity(horizontal: -4.w, vertical: -4.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: leading,
        dense: true,
        title: Text(
          'Rodolfo Goode',
          style: reviewtitlestyle,
        ),
        subtitle: Text(
          '6 days ago',
          style: normaltextStyle,
        ),
        trailing: trailing);
  }
}


  