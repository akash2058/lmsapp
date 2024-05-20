import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LandingPageHead extends StatelessWidget {
  String img;
  LandingPageHead({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(img))),
    );
  }
}
