
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let’s Talk",
              style: authenticationtitlestyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Enter the email associated with your account and we’ll send an email with code to reset your password.',
              style: aboutustyle,
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              'First Name',
              style: reviewtitlestyle,
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomFormField(hint: 'Enter Your Name'),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Email',
              style: reviewtitlestyle,
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomFormField(hint: 'Enter your email address'),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Phone Number',
              style: reviewtitlestyle,
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomFormField(hint: 'Enter your number'),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Description',
              style: reviewtitlestyle,
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomFormField(maxlines: 3, hint: 'Write Down Here'),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(height: 53.h, text: 'Submit', onTap: () {})
          ],
        ),
      ),
    );
  }
}
