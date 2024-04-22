import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CustomTile extends StatelessWidget {
  Widget? leading;
  Widget? trailing;
  String title;
  String subtitle;
  Color? bordorcolor;
  VoidCallback? onTap;

  CustomTile({
    Key? key,
    this.onTap,
    required this.title,
    required this.subtitle,
    this.leading,
    this.bordorcolor,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      visualDensity: VisualDensity(horizontal: -4.w, vertical: -4.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      dense: true,
      title: Text(
        title,
        style: reviewtitlestyle,
      ),
      subtitle: Text(
        subtitle,
        style: lessonfontt,
      ),
      trailing: trailing,
    );
  }
}
