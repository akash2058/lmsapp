import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              'Confirm',
              style: authenticationtitlestyle,
            ),
            Text(
              'Your Email Address',
              style: authenticationtitlestyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Enter the email associated with your account and we’ll send an email with code to reset your password.',
              style: anotherormaltextStyle,
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              'Email',
              style: othernormaltextStyle,
            ),
            AppSizeBox.defaultHeightforsplash,
            CustomFormField(hint: 'enter your email'),
            SizedBox(
              height: 32.h,
            ),
            CustomButton(text: 'Send Code', onTap: () {})
          ],
        ),
      ),
    );
  }
}
