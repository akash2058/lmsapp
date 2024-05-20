import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';

class ReferalPage extends StatelessWidget {
  const ReferalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
            autoapply: true,
        actions: [
        // ignore: prefer_const_constructors
        Icon(Icons.more_horiz),
        SizedBox(
          width: 20.w,
        )
      ], title: 'Referral System'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            CustomFormField(hint: 'Enter Your Email'),
            SizedBox(
              height: 32.h,
            ),
            CustomButton(height: 53.h, text: 'Send Coupone Code', onTap: () {})
          ],
        ),
      ),
    );
  }
}
