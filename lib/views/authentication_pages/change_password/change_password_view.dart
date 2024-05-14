import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:provider/provider.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: CustomAppbar(autoapply: true, title: 'Change Password'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Password',
                    style: othernormaltextStyle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomFormField(
                      hidepassword: auth.hideenterpassword,
                      suffix: GestureDetector(
                          onTap: () {
                            auth.hidepassword();
                          },
                          child: Icon(auth.hideenterpassword == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      controller: auth.currentpasswordcontroller,
                      validation: validatePassword,
                      hint: 'current password'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'New Password',
                    style: othernormaltextStyle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomFormField(
                      suffix: GestureDetector(
                          onTap: () {
                            auth.hidecreatepassword();
                          },
                          child: Icon(auth.hidecreatepasswords == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      hidepassword: auth.hidecreatepasswords,
                      controller: auth.newpasswordcontroller,
                      validation: validatePassword,
                      hint: 'current password'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Confirm Password',
                    style: othernormaltextStyle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomFormField(
                      suffix: GestureDetector(
                          onTap: () {
                            auth.hideconfirmpasswords();
                          },
                          child: Icon(auth.hideconfirmpassword == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      hidepassword: auth.hideconfirmpassword,
                      controller: auth.confirmpasswordcontroller,
                      validation: validatePassword,
                      hint: 'Confirm password'),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                      height: 53.h,
                      text: auth.loadingchangepassword == true
                          ? 'Please Wait....'
                          : 'change password',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          auth.getchangepassword(
                            context,
                          );
                        }
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
