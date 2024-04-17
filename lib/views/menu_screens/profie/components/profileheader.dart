import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  String name;
  String email;
  String img;
  ProfileHeader(
      {super.key, required this.name, required this.email, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56.h,
              width: 56.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(img)),
                  shape: BoxShape.circle),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: titlestyle,
                ),
                Text(
                  email,
                  style: normaltextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
