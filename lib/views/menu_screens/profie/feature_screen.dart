import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/authentication_pages/change_password/change_password_view.dart';
import 'package:lmsapp/views/drawer/drawer_screen/certificatescreen.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/landingpages/profile_screen.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/paymenthistorypage.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/purchasecoursepage.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/referalpage.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/wishlistpage.dart';
import 'package:lmsapp/views/notification/lms_notification.dart';
import 'package:provider/provider.dart';


class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<FeatureScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profiledata();
    });
  }

  profiledata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getMyProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, auth, child) {
        var state = Provider.of<AuthenticationProvider>(context, listen: false);

        return Scaffold(
          appBar: CustomAppbar(
            autoapply: false,
            title: 'Features',
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
                                CustomPageRoute(child: const ProfileScreen()));
                          },
                          leading: Icon(
                            Icons.person,
                            size: 24.h,
                          ),
                          title: 'My Profile'),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
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
                      ),
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
                      ),
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
                      ),
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
                      ),
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
                      ),
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
                      ),
                      Divider(
                        thickness: 2.h,
                        color: AppColors.lightwhite,
                      ),
                      CustomTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              CustomPageRoute(
                                  child: const ChangePasswordView()));
                        },
                        leading: SvgPicture.asset(
                          SvgImages.setting,
                          height: 24.h,
                        ),
                        title: 'Change Password',
                      ),
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
                      state.logout(context);
                    },
                    minVerticalPadding: 10,
                    visualDensity:
                        VisualDensity(horizontal: -4.w, vertical: -4.h),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    dense: true,
                    minLeadingWidth: 10,
                    title: Text(
                      state.loadinglogout == true
                          ? 'Please Wait....'
                          : 'Logout',
                      style: logoutfont,
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
