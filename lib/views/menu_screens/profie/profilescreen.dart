import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/profie/components/profileheader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: pricefont,
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 24.h,
          ),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(
              name: 'Bimantara Afif',
              email: 'bimantara@email.co',
              img: AppImages.imgone,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 102.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.bordercolor)),
                child: Text(
                  'Edit Profile',
                  style: editprofilefont,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Divider(
              thickness: 4.h,
              color: AppColors.lightwhite,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTile(
                      leading: SvgPicture.asset(
                        SvgImages.notifica,
                      ),
                      title: 'Notification',
                      subtitle: 'Ringtone, message, notification'),
                  Divider(
                    thickness: 2.h,
                    color: AppColors.lightwhite,
                  ),
                  CustomTile(
                      leading: SvgPicture.asset(SvgImages.heart),
                      title: 'Whish list',
                      subtitle: 'Your favorite courses'),
                  Divider(
                    thickness: 2.h,
                    color: AppColors.lightwhite,
                  ),
                  CustomTile(
                      leading: SvgPicture.asset(SvgImages.cart),
                      title: 'Purchased Courses',
                      subtitle: 'Courses you have purchased'),
                  Divider(
                    thickness: 2.h,
                    color: AppColors.lightwhite,
                  ),
                  CustomTile(
                      leading: SvgPicture.asset(SvgImages.pay),
                      title: 'Payment History',
                      subtitle: 'Courses you have orders'),
                  Divider(
                    thickness: 2.h,
                    color: AppColors.lightwhite,
                  ),
                  CustomTile(
                      leading: SvgPicture.asset(SvgImages.achive),
                      title: 'Achievements and Certificates',
                      subtitle: 'Achievements, badges, and certificates'),
                  Divider(
                    thickness: 2.h,
                    color: AppColors.lightwhite,
                  ),
                  CustomTile(
                      leading: SvgPicture.asset(SvgImages.pay),
                      title: 'Referral system',
                      subtitle: 'Achievements, badges, and certificates'),
                  Divider(
                    thickness: 2.h,
                    color: AppColors.lightwhite,
                  ),
                  CustomTile(
                      leading: SvgPicture.asset(SvgImages.setting),
                      title: 'Preferences',
                      subtitle: 'Theme, Settings'),
                ],
              ),
            ),
            const Divider(
              color: AppColors.bordercolor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: ListTile(
                minVerticalPadding: 10,
                visualDensity: VisualDensity(horizontal: -4.w, vertical: -4.h),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                dense: true,
                minLeadingWidth: 10,
                title: Text(
                  'Logout',
                  style: logoutfont,
                ),
                subtitle: Text(
                  'Log out the account',
                  style: normaltextStyle,
                ),
                leading: SvgPicture.asset(
                  SvgImages.logout,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
