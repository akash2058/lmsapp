import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';

import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
import 'package:lmsapp/views/authentication_pages/authenticationcontroller.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultpintheme = PinTheme(
        height: 66.h,
        width: 66.w,
        textStyle: formfieldstyle,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.51.r),
            border: Border.all(color: AppColors.primarygrey)));
    final otpkey = GlobalKey<FormState>();
    return Consumer<AuthenticationProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 110.h),
            child: Form(
              key: otpkey,
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
                  Pinput(
                    defaultPinTheme: defaultpintheme,
                    focusedPinTheme: defaultpintheme,
                    validator: validateotp,
                    keyboardType: TextInputType.number,
                    controller: value.otpcontroller,
                    length: 5,
                  ),
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
                  const Spacer(),
                  CustomButton(
                      height: 53.h,
                      text: value.loadingverification == true
                          ? 'Please Wait'
                          : 'Verify and register account',
                      onTap:
                          // ignore: unrelated_type_equality_checks
                          value.registers?.data?.otp == value.otpcontroller.text
                              ? () {
                                  if (otpkey.currentState!.validate()) {
                                    value.fetchotp(context);
                                  }
                                }
                              : () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: AppColors.primaryred,
                                          content: Text('OTP Not Valid !!!')));
                                })
                ],
              ),
            ),
          ),
        );
      },
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
