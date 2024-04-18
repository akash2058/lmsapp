import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';


class CustomTile extends StatelessWidget {
  Widget? leading;
  Widget? trailing;
  String title;
  String subtitle;
  Color? bordorcolor;

  CustomTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.bordorcolor,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      dense: true,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          const SizedBox(width: 8), // Adjust the width as needed
          Text(
            title,
            style: reviewtitlestyle,
          ),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: Text(
          subtitle,
          style: subtitlefont,
        ),
      ),
      trailing: trailing,
    );
  }
}
