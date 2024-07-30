import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.nointernet),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'No Internet Connection',
              style: titlestyle,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Check your internet connection',
              style: hinttextstyle,
            )
          ],
        ),
      ),
    );
  }
}
