import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appimages.dart';

class LandingPageHead extends StatelessWidget {
  final String? img;

  const LandingPageHead({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(),
      child: img == null
          ? Image.asset(
              AppImages.applogo,
              fit: BoxFit.cover,
            )
          : Image.network(
              img!,
              fit: BoxFit.cover,
            ),
    );
  }
}
