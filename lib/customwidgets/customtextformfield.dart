import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  String hint;
  TextInputType? inputType;
  TextEditingController? controller;
  FormFieldValidator? validation;
  Widget? prefix;
  Widget? suffix;
  CustomFormField(
      {super.key,
      required this.hint,
      this.controller,
      this.suffix,
      this.prefix,
      this.inputType,
      this.validation});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primarylightgrey)),
      child: TextFormField(
        style: formfieldstyle,
        decoration: InputDecoration(
            suffixIcon: suffix,
            prefixIcon: prefix,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.only(top: 15.h, left: 14.w, bottom: 15.h),
            isDense: true,
            hintStyle: formfieldstyle,
            hintText: hint),
      ),
    );
  }
}
