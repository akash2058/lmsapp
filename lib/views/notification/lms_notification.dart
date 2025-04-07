import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/courselandingpage/courselandingpage.dart';
import 'package:provider/provider.dart';

class LmsNotifcation extends StatefulWidget {
  const LmsNotifcation({super.key});

  @override
  State<LmsNotifcation> createState() => _LmsNotifcationState();
}

class _LmsNotifcationState extends State<LmsNotifcation> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, nots, child) {
        return Scaffold(
          appBar: CustomAppbar(
            autoapply: true,
            title: 'Notifications',
          ),
          body: nots.loadingnotifications == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primarybrown,
                ))
              : nots.notification?.data?.isEmpty ?? true
                  ? Center(
                      child: Text(
                        'No Notifications !!!',
                        style: appbartitlestyle,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 28.w, vertical: 24.h),
                      child: Column(
                          children: List.generate(
                              nots.notification?.data?.length ?? 0, (index) {
                        var data = nots.notification?.data?[index];
                        return Column(
                          children: [
                            CustomTile(
                              onTap: () {
                                if (data?.section == 'orders') {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          child: CourseLandingPage(
                                              id: data?.id.toString() ?? '')));
                                }
                              },
                              trailing: Text(
                                data?.createdAt ?? '',
                                style: subtitlefont,
                              ),
                              title: data?.title ?? '',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        );
                      })),
                    ),
        );
      },
    );
  }
}
