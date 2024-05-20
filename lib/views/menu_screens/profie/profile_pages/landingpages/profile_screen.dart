import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/profie/components/profileheader.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/landingpages/editprofile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      profiledata();
    });
  }

  Future<void> profiledata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    var auth = Provider.of<AuthenticationProvider>(context, listen: false);

    await state.getMyProfile();
    await auth.loadLoginData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, pro, child) {
        var state = Provider.of<AuthenticationProvider>(context, listen: false);
        return Scaffold(
          appBar: CustomAppbar(autoapply: true, title: 'My Profile'),
          body: pro.loadinggetprofile == true
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  color: AppColors.primarybrown,
                  onRefresh: profiledata,
                  child: ListView(
                    children: [
                      ProfileHeader(
                        name: state.name,
                        email: state.email,
                        img:
                            '${pro.profile?.data?.baseurl}/${pro.profile?.data?.photo}',
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 102.w),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                CustomPageRoute(child: const EditProfille()));
                          },
                          child: Container(
                            width: 105.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border:
                                    Border.all(color: AppColors.bordercolor)),
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: editprofilefont,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 4.h,
                        color: AppColors.lightwhite,
                      ),
                      Column(
                        children: [
                          CustomTile(
                              subtitle:
                                  pro.profile?.data?.phone.toString() ?? '',
                              leading: Icon(
                                Icons.phone,
                                size: 24.h,
                                color: AppColors.primarybrown,
                              ),
                              title: 'Phone Number'),
                          Divider(
                            thickness: 4.h,
                            color: AppColors.lightwhite,
                          ),
                          CustomTile(
                              subtitle: pro.profile?.data?.dob ?? '',
                              leading: Icon(
                                Icons.date_range,
                                size: 24.h,
                                color: AppColors.primarybrown,
                              ),
                              title: 'Birthday'),
                          Divider(
                            thickness: 4.h,
                            color: AppColors.lightwhite,
                          ),
                          CustomTile(
                              subtitle: pro.profile?.data?.address ?? '',
                              leading: Icon(
                                Icons.location_on,
                                size: 24.h,
                                color: AppColors.primarybrown,
                              ),
                              title: 'Permanent Address'),
                          Divider(
                            thickness: 4.h,
                            color: AppColors.lightwhite,
                          ),
                          CustomTile(
                              subtitle: pro.profile?.data?.state ?? '',
                              leading: Image.asset(
                                AppImages.states,
                                color: AppColors.primarybrown,
                                height: 24.h,
                              ),
                              title: 'State'),
                          Divider(
                            thickness: 4.h,
                            color: AppColors.lightwhite,
                          ),
                          CustomTile(
                              subtitle: pro.profile?.data?.city ?? '',
                              leading: Icon(
                                Icons.location_city,
                                size: 24.h,
                                color: AppColors.primarybrown,
                              ),
                              title: 'City'),
                          Divider(
                            thickness: 4.h,
                            color: AppColors.lightwhite,
                          ),
                          CustomTile(
                              subtitle: pro.profile?.data?.country ?? '',
                              leading: Image.asset(
                                AppImages.country,
                                color: AppColors.primarybrown,
                                height: 24.h,
                              ),
                              title: 'Country'),
                          Divider(
                            thickness: 4.h,
                            color: AppColors.lightwhite,
                          ),
                          CustomTile(
                              subtitle: pro.profile?.data?.postcode ?? '',
                              leading: Image.asset(
                                AppImages.postalcode,
                                color: AppColors.primarybrown,
                                height: 24.h,
                              ),
                              title: 'Postal Code'),
                        ],
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
