import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomSearchField extends StatelessWidget {
  String hint;
  Widget? prefix;
  Widget? suffix;
  CustomSearchField({super.key, required this.hint, this.prefix, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 1,
        color: AppColors.secondarylight,
        child: TextFormField(
          style: hintstyle,
          decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minWidth: 56.w),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
              isDense: true,
              hintStyle: searchintfont,
              prefixIcon: prefix,
              suffix: suffix,
              hintText: hint,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
