import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/views/drawer/drawerscreen/aboutuscreen.dart';
import 'package:lmsapp/views/drawer/drawerscreen/appguidlinescreen.dart';
import 'package:lmsapp/views/drawer/drawerscreen/certificatescreen.dart';
import 'package:lmsapp/views/drawer/drawerscreen/helpscreen.dart';
import 'package:lmsapp/views/drawer/drawerscreen/policyscreen.dart';

class LmsDrawer extends StatelessWidget {
  const LmsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52.h,
              width: 54.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppImages.applogo))),
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomTile(
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const AboutUsScreen()));
              },
              leading: SvgPicture.asset(
                SvgImages.about,
                height: 24.h,
              ),
              title: 'About us',
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTile(
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const HelpScreen()));
              },
              leading: SvgPicture.asset(
                SvgImages.chat,
                height: 24.h,
              ),
              title: 'Help',
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTile(
              onTap: () {
                Navigator.push(context,
                    CustomPageRoute(child: const AppGuideLineScreen()));
              },
              leading: SvgPicture.asset(
                SvgImages.help,
                height: 24.h,
              ),
              title: 'How to use app',
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTile(
              leading: SvgPicture.asset(
                SvgImages.review,
                height: 24.h,
              ),
              title: 'Our students reviews',
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTile(
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const CertificateScreen()));
              },
              leading: SvgPicture.asset(
                SvgImages.achive,
                height: 24.h,
              ),
              title: 'Achievements and Certificates',
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTile(
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const PolicyScreen()));
              },
              leading: SvgPicture.asset(
                SvgImages.policy,
                height: 24.h,
              ),
              title: 'Privacy policy',
            ),
          ],
        ),
      ),
    );
  }
}
