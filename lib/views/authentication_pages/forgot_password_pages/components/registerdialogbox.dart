import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';
import 'package:provider/provider.dart';

class RegisterSuccesfuldialog extends StatefulWidget {
  String name;
  String email;
  String password;
   RegisterSuccesfuldialog({
    super.key,
    required this.name,
    required this.email,
    required this.password
  });

  @override
  State<RegisterSuccesfuldialog> createState() =>
      _RegisterSuccesfuldialogState();
}

class _RegisterSuccesfuldialogState extends State<RegisterSuccesfuldialog> {
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
              Navigator.push(
                  context, CustomPageRoute(child: const LoginPage()));
            })
      ],
    );
  }
}
