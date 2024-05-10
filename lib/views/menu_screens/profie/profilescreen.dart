import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authenticationcontroller.dart';
import 'package:lmsapp/views/drawer/drawerscreen/certificatescreen.dart';
import 'package:lmsapp/views/menu_screens/profie/components/profileheader.dart';
import 'package:lmsapp/views/menu_screens/profie/profilepages/landingpages/editprofile.dart';
import 'package:lmsapp/views/menu_screens/profie/profilepages/paymenthistorypage.dart';
import 'package:lmsapp/views/menu_screens/profie/profilepages/purchasecoursepage.dart';
import 'package:lmsapp/views/menu_screens/profie/profilepages/referalpage.dart';
import 'package:lmsapp/views/menu_screens/profie/profilepages/wishlistpage.dart';
import 'package:lmsapp/views/notification/lmsnotification.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: CustomAppbar(
            autoapply: false,
            title: 'Profile',
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
                  name: auth.user?.data?.name.toString() ?? '',
                  email: auth.user?.data?.email.toString() ?? '',
                  img: AppImages.imgone,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 102.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, CustomPageRoute(child: EditProfille()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.bordercolor)),
                      child: Text(
                        'Edit Profile',
                        style: editprofilefont,
                      ),
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
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTile(
                          onTap: () {
                            Navigator.push(context,
                                CustomPageRoute(child: const LmsNotifcation()));
                          },
                          leading: SvgPicture.asset(
                            SvgImages.notifica,
                            height: 24.h,
                          ),
                          title: 'Notification',
                          subtitle: 'Ringtone, message, notification'),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
                      CustomTile(
                          onTap: () {
                            Navigator.push(context,
                                CustomPageRoute(child: const WishListPage()));
                          },
                          leading: SvgPicture.asset(
                            SvgImages.heart,
                            height: 24.h,
                          ),
                          title: 'Whish list',
                          subtitle: 'Your favorite courses'),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
                      CustomTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: const PurchaseCoursePage()));
                          },
                          leading: SvgPicture.asset(
                            SvgImages.cart,
                            height: 24.h,
                          ),
                          title: 'Purchased Courses',
                          subtitle: 'Courses you have purchased'),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
                      CustomTile(
                          onTap: () {
                            Navigator.push(context,
                                CustomPageRoute(child: const PaymentHistory()));
                          },
                          leading: SvgPicture.asset(
                            SvgImages.pay,
                            height: 24.h,
                          ),
                          title: 'Payment History',
                          subtitle: 'Courses you have orders'),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
                      CustomTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: const CertificateScreen()));
                          },
                          leading: SvgPicture.asset(
                            SvgImages.achive,
                            height: 24.h,
                          ),
                          title: 'Achievements and Certificates',
                          subtitle: 'Achievements, badges, and certificates'),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
                      CustomTile(
                          onTap: () {
                            Navigator.push(context,
                                CustomPageRoute(child: const ReferalPage()));
                          },
                          leading: SvgPicture.asset(
                            SvgImages.pay,
                            height: 24.h,
                          ),
                          title: 'Referral system',
                          subtitle: 'Achievements, badges, and certificates'),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
                      CustomTile(
                          leading: SvgPicture.asset(
                            SvgImages.setting,
                            height: 24.h,
                          ),
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
                    onTap: () {
                      auth.logout(auth.user?.data?.token, context);
                    },
                    minVerticalPadding: 10,
                    visualDensity:
                        VisualDensity(horizontal: -4.w, vertical: -4.h),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    dense: true,
                    minLeadingWidth: 10,
                    title: Text(
                      auth.loadinglogout == true ? 'Please Wait....' : 'Logout',
                      style: logoutfont,
                    ),
                    subtitle: Text(
                      'Log out the account',
                      style: normaltextStyle,
                    ),
                    leading: SvgPicture.asset(
                      SvgImages.logout,
                      height: 24.h,
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
      },
    );
  }
}
