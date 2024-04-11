import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/utilities/appimages.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 73.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AppImages.home,
              height: 24.h,
            ),
            SvgPicture.asset(
              AppImages.chat,
              height: 24.h,
            ),
            SvgPicture.asset(
              AppImages.cart,
              height: 24.h,
            ),
            SvgPicture.asset(
              AppImages.profile,
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
