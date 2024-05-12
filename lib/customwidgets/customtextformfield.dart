import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  int? maxlines;
  Color? fillcolor;
  String hint;
  bool? hidepassword;
  TextInputType? inputType;
  TextEditingController? controller;
  FormFieldValidator<String>? validation;
  Widget? prefix;
  Widget? suffix;

  CustomFormField({
    Key? key,
    required this.hint,
    this.controller,
    this.fillcolor,
    this.hidepassword,
    this.suffix,
    this.prefix,
    this.maxlines,
    this.inputType,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        style: formfieldstyle,
        controller: controller,
        obscureText: hidepassword ?? false,
        validator: validation ?? (value) => null,
        decoration: InputDecoration(
          // errorText: 'Wrong creds',
          errorStyle: paymentpricestyle,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          isDense: true,
          hintText: hint,

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.primarylightgrey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.primarylightgrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.primarylightgrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.primarylightgrey),
          ),
          border: InputBorder.none,
          hintStyle: hinttextstyle,
          suffixIcon: suffix,
          prefixIcon: prefix,
        ),
      ),
    );
  }
}
