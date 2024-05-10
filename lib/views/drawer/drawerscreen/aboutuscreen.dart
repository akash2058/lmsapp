import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authenticationcontroller.dart';
import 'package:lmsapp/views/drawer/drawerscreen/controller/drawercontroller.dart';
import 'package:lmsapp/views/menucard/main_menu_providers.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      aboutus();
    });
  }

  void aboutus() async {
    var userdata = Provider.of<AuthenticationProvider>(context, listen: false);
    var state = Provider.of<DrawerProvider>(context, listen: false);
    await state.getAboutusdata(userdata.user?.data?.token);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, draw, child) {
        return Consumer<MenuProviders>(
          builder: (context, menu, child) {
            return Scaffold(
              appBar: AppBar(),
              body: draw.loadingaboutus == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primarybrown,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 28.w, vertical: 20.h),
                            child: Text(
                              'About Us',
                              style: authenticationtitlestyle,
                            ),
                          ),
                          // Container(
                          //   height: 170.h,
                          //   width: MediaQuery.sizeOf(context).width,
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           image: NetworkImage(
                          //               '${menu.home?.data?.baseUrl}/${draw.about?.data?.aboutUs?.aboutImage}'))),
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.w),
                            child: Column(
                              children: [
                                HtmlWidget(
                                  draw.about?.data?.aboutUs?.aboutDescription
                                          .toString() ??
                                      '',
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
