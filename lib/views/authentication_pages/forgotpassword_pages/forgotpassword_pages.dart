import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
import 'package:lmsapp/views/authentication_pages/authenticationcontroller.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      forgotdata();
    });
  }

  void forgotdata() {
    var state = Provider.of<AuthenticationProvider>(context, listen: false);

    state.emailcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.h),
            child: Form(
              key: formkey,
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
                  CustomFormField(
                      controller: auth.emailcontroller,
                      validation: validateEmail,
                      hint: 'enter your email'),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomButton(
                      height: 53.h,
                      text: auth.loadingforgotpassword == true
                          ? 'Please Wait...'
                          : 'Send Code',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          auth.getforgotPassword(context);
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
