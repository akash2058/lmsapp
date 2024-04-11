import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              'Register',
              style: authenticationtitlestyle,
            ),
            Text(
              'New Account',
              style: authenticationtitlestyle,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Name',
              style: othernormaltextStyle,
            ),
            AppSizeBox.defaultHeightforsplash,
            CustomFormField(hint: 'enter your Name'),
            AppSizeBox.defaultHeight,
            Text(
              'Email',
              style: othernormaltextStyle,
            ),
            AppSizeBox.defaultHeightforsplash,
            CustomFormField(hint: 'enter your email'),
            AppSizeBox.defaultHeight,
            Text(
              'Create Password',
              style: othernormaltextStyle,
            ),
            AppSizeBox.defaultHeightforsplash,
            CustomFormField(hint: 'enter your created password'),
            AppSizeBox.defaultHeight,
            Text(
              'Confirm Password',
              style: othernormaltextStyle,
            ),
            AppSizeBox.defaultHeightforsplash,
            CustomFormField(hint: 'enter your confirm password'),
            AppSizeBox.defaultHeight,
            CustomButton(text: 'Register', onTap: () {}),
            Row(
              children: [
                Transform.scale(
                  scale: 0.8.w,
                  child: Checkbox(
                    activeColor: AppColors.primarybrown,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: true,
                    onChanged: (newValue) {},
                  ),
                ),
                Text(
                  'I agree to',
                  style: otherstyle,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Terms and condition',
                  style: otherfont,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
