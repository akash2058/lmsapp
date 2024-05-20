import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu.dart';

class RollInPage extends StatelessWidget {
  const RollInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110.h,
            ),
            Text(
              'What course are you interested in?',
              style: onboardtitle,
            ),
            SizedBox(
              height: 48.h,
            ),
            Text(
              'Anywhere, anytime. The time is at your discretion so study whenever.',
              style: aboutustyle,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Computer network(3)',
              style: titlestyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                RollCourseCard(
                  text: 'Computer Communications',
                ),
                SizedBox(
                  width: 8.w,
                ),
                RollCourseCard(
                  text: 'SD-WAN',
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Networking(2)',
              style: titlestyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                RollCourseCard(
                  text: 'CCNA 200-301',
                ),
                SizedBox(
                  width: 8.w,
                ),
                RollCourseCard(
                  text: 'CCNP Route',
                ),
                SizedBox(
                  width: 8.w,
                ),
                RollCourseCard(
                  text: 'Node.js',
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Networking security(4)',
              style: titlestyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                RollCourseCard(
                  text: 'CCNA 200-301',
                ),
                SizedBox(
                  width: 8.w,
                ),
                RollCourseCard(
                  text: 'CCNP Route',
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'SDWAN',
              style: titlestyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                RollCourseCard(
                  text: 'CCNA 200-301',
                ),
                SizedBox(
                  width: 8.w,
                ),
                RollCourseCard(
                  text: 'Node.js',
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
                height: 53.h,
                text: 'Roll In',
                onTap: () {
                  Navigator.push(context, CustomPageRoute(child: const MainMenu()));
                }),
            SizedBox(
              height: 24.h,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RollCourseCard extends StatelessWidget {
  String text;
  RollCourseCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primarygrey)),
      child: Text(
        text,
        style: coursestyle,
      ),
    );
  }
}
