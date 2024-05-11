import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
import 'package:lmsapp/views/authentication_pages/authenticationcontroller.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';
import 'package:lmsapp/views/authentication_pages/otpscreen/otpscreen.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fomrkeys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Form(
              key: fomrkeys,
              child: SingleChildScrollView(
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
                    CustomFormField(
                        validation: validatename,
                        controller: auth.namecontroller,
                        hint: 'enter your Name'),
                    AppSizeBox.defaultHeight,
                    Text(
                      'Email',
                      style: othernormaltextStyle,
                    ),
                    AppSizeBox.defaultHeightforsplash,
                    CustomFormField(
                        validation: validateEmail,
                        controller: auth.emailcontroller,
                        hint: 'enter your email'),
                    AppSizeBox.defaultHeight,
                    Text(
                      'Create Password',
                      style: othernormaltextStyle,
                    ),
                    AppSizeBox.defaultHeightforsplash,
                    CustomFormField(
                        validation: validatePassword,
                        controller: auth.passwordcontroller,
                        hint: 'enter your created password'),
                    AppSizeBox.defaultHeight,
                    Text(
                      'Confirm Password',
                      style: othernormaltextStyle,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomFormField(
                        validation: validaterepeatPassword,
                        controller: auth.confirmpasswordcontroller,
                        hint: 'enter your confirm password'),
                    SizedBox(
                      height: 32.h,
                    ),
                    auth.termsandcondition == true
                        ? CustomButton(
                            height: 53.h,
                            text: auth.loadingregister == true
                                ? 'Please Wait.....'
                                : 'Register',
                            onTap: () {
                              if (fomrkeys.currentState!.validate()) {
                                auth.fetchRegister(context);
                              }
                            })
                        : CustomSmallButton(
                            height: 53.h,
                            textcolor: AppColors.primarywhite,
                            backgroudcolor: AppColors.primarygrey,
                            width: MediaQuery.sizeOf(context).width,
                            text: 'Register',
                            onTap: () {},
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
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
                            value: auth.termsandcondition,
                            onChanged: (newValue) {
                              setState(() {
                                auth.termsandcondition = newValue!;
                              });
                            },
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
            ),
          ),
        );
      },
    );
  }
}
