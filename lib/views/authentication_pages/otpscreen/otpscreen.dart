import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';

import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/registersuccessfulpage/registersuccesfullpage.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 110.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We have send',
              style: authenticationtitlestyle,
            ),
            Text(
              'OTP to your email',
              style: authenticationtitlestyle,
            ),
            SizedBox(
              height: 32.h,
            ),
            OtpField(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  'Didn’t get OTP?',
                  style: otpstyle,
                ),
                Text(
                  'Resend OTP',
                  style: resendotpstyle,
                )
              ],
            ),
            Spacer(),
            CustomButton(
                height: 53.h,
                text: 'Verify and register account',
                onTap: () {
                  Navigator.push(
                      context, CustomPageRoute(child: RegisterSuccessPage()));
                })
          ],
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 66.h,
            width: 66.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.51.r),
                border: Border.all(color: AppColors.secondarygrey)),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: hintstyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  isDense: true,
                  border: InputBorder.none),
            )),
        Container(
            height: 66.h,
            width: 66.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.51.r),
                border: Border.all(color: AppColors.secondarygrey)),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: hintstyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  isDense: true,
                  border: InputBorder.none),
            )),
        Container(
            height: 66.h,
            width: 66.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.51.r),
                border: Border.all(color: AppColors.secondarygrey)),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: hintstyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  isDense: true,
                  border: InputBorder.none),
            )),
        Container(
            height: 66.h,
            width: 66.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.51.r),
                border: Border.all(color: AppColors.secondarygrey)),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: hintstyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  isDense: true,
                  border: InputBorder.none),
            )),
        Container(
            height: 66.h,
            width: 66.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.51.r),
                border: Border.all(color: AppColors.secondarygrey)),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: hintstyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  isDense: true,
                  border: InputBorder.none),
            )),
      ],
    );
  }
}
