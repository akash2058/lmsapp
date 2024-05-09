import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';

class RegisterSuccesfuldialog extends StatelessWidget {
  String email;
  String password;
  String name;
   RegisterSuccesfuldialog({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(AppImages.successlogo),
      ),
      content: Text(
        textAlign: TextAlign.center,
        'Register Succesfully now you can Login',
        style: titlestyle,
      ),
      actions: [
        CustomButton(
            height: 53.h,
            text: 'Back To Login',
            onTap: () {
              Navigator.push(context, CustomPageRoute(child: LoginPage()));
            })
      ],
    );
  }
}