import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';
import 'package:lmsapp/views/boardscreen/boardscreen.dart';
import 'package:lmsapp/views/menucard/main_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashscreen();
  }

  void splashscreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context, CustomPageRoute(child: const LoginPage()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.applogo,
              height: 68.h,
            ),
            AppSizeBox.defaultHeightforsplash,
            Text('Loading...', style: normaltextStyle),
            AppSizeBox.defaultHeight,
            SizedBox(
              width: 148.w,
              child: const LinearProgressIndicator(
                color: AppColors.primarybrown,
              ),
            )
          ],
        ),
      ),
    );
  }
}
