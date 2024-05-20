import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/defaultsize.dart';
import 'package:lmsapp/utilities/textstyle.dart';


import '../../utilities/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToOnBoard();
  }

  moveToOnBoard() async {
    Future.delayed(const Duration(seconds: 2), () {
      Utils.manipulateLogin(context);
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
