import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/login_page/components/components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              'Hello!',
              style: authenticationtitlestyle,
            ),
            Text(
              'Welcome Back',
              style: authenticationtitlestyle,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Email',
              style: othernormaltextStyle,
            ),
            AppSizeBox.defaultHeightforsplash,
            CustomFormField(hint: 'Enter Your Email'),
            AppSizeBox.defaultHeight,
            Text(
              'Password',
              style: othernormaltextStyle,
            ),
            AppSizeBox.defaultHeightforsplash,
            CustomFormField(hint: 'Enter Your Password'),
            AppSizeBox.defaultHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8.w,
                      child: Checkbox(
                        activeColor: AppColors.primarybrown,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        value: true,
                        onChanged: (newValue) {},
                      ),
                    ),
                    Text(
                      'Remember me',
                      style: otherstyle,
                    ),
                  ],
                ),
                Text(
                  'Forgot Password',
                  style: otherstyle,
                ),
              ],
            ),
            AppSizeBox.defaultHeight,
            CustomButton(
              text: 'Next',
              onTap: () {},
            ),
            AppSizeBox.defaultHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1.h,
                  width: 168.w,
                  color: AppColors.primarylowlightdark,
                ),
                Text(
                  'Or',
                  style: getfonts,
                ),
                Container(
                  height: 1.h,
                  width: 168.w,
                  color: AppColors.primarylowlightdark,
                ),
              ],
            ),
            AppSizeBox.defaultHeight,
            const GoogleCard(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont’t have an account?",
                  style: fonts,
                ),
                SizedBox(
                  width: 6.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Register',
                    style: otherfont,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
