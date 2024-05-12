import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
import 'package:lmsapp/views/authentication_pages/authenticationcontroller.dart';
import 'package:lmsapp/views/authentication_pages/forgotpassword_pages/forgotpassword_pages.dart';
import 'package:lmsapp/views/authentication_pages/register_page/register_page.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      logincrediantial();
    });
    super.initState();
  }

  void logincrediantial() {
    var clean = Provider.of<AuthenticationProvider>(context, listen: false);
    clean.emailcontroller.clear();
    clean.passwordcontroller.clear();
  }

  final fomrkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Form(
              key: fomrkey,
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
                  CustomFormField(
                      controller: auth.emailcontroller,
                      validation: validateEmail,
                      maxlines: 1,
                      hint: 'Enter Your Email'),
                  AppSizeBox.defaultHeight,
                  Text(
                    'Password',
                    style: othernormaltextStyle,
                  ),
                  AppSizeBox.defaultHeightforsplash,
                  CustomFormField(
                      suffix: GestureDetector(
                        onTap: () {
                          auth.hidepassword();
                        },
                        child: Icon(
                          auth.hideenterpassword == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 25.h,
                          color: AppColors.primarybrown,
                        ),
                      ),
                      hidepassword: auth.hideenterpassword,
                      controller: auth.passwordcontroller,
                      validation: validatePassword,
                      maxlines: 1,
                      hint: 'Enter Your Password'),
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
                              visualDensity: VisualDensity(
                                horizontal: -4.w,
                                vertical: -4.h,
                              ),
                              value: true,
                              onChanged: (newValue) {
                                setState(() {});
                              },
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: hinttextstyle,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CustomPageRoute(child: const ForgotPassword()));
                        },
                        child: Text(
                          'Forgot Password',
                          style: hinttextstyle,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                      height: 53.h,
                      text: auth.loadinguser == true ? 'Loading....' : 'Login',
                      onTap: () {
                        if (fomrkey.currentState!.validate()) {
                          auth.getLogin(context);
                        }
                      }
                      // Provide an empty function as a default when the condition is not met
                      ),
                  AppSizeBox.defaultHeight,
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
                        onTap: () {
                          Navigator.push(context,
                              CustomPageRoute(child: const RegisterPage()));
                        },
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
          ),
        );
      },
    );
  }
}
