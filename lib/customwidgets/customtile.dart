import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
  Widget? leading;
  Widget? trailing;
  String title;
  String? subtitle;
  Color? bordorcolor;
  VoidCallback? onTap;

  CustomTile({
    Key? key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.leading,
    this.bordorcolor,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 10.w,
      onTap: onTap,
      leading: leading,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      dense: true,
      title: Text(
        title,
        style: reviewtitlestyle,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: lessonfontt,
            )
          : null,
      trailing: trailing,
    );
  }
}
