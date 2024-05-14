import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/rollinpage/roll_inpage.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 262.h,
              ),
              Container(
                height: 153.h,
                width: 153.w,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(AppImages.successlogo))),
              ),
              SizedBox(
                height: 29.h,
              ),
              Text(
                'Account Register',
                style: onboardtitle,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'Your account has been register successfully',
                style: aboutustyle,
              ),
              Spacer(),
              CustomButton(
                  height: 53.h,
                  text: 'Confirm',
                  onTap: () {
                    Navigator.push(
                        context, CustomPageRoute(child: RollInPage()));
                  }),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
