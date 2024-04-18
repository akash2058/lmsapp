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
      minLeadingWidth: 10.w,
      leading: leading,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      dense: true,
      title: Text(
        title,
        style: reviewtitlestyle,
      ),
      subtitle: Text(
        subtitle,
        style: subtitlefont,
      ),
      trailing: trailing,
    );
  }
}
