import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authenticationcontroller.dart';
import 'package:lmsapp/views/drawer/drawerscreen/controller/drawercontroller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      privacyPolicy();
    });
  }

  void privacyPolicy() async {
    var userdata = Provider.of<AuthenticationProvider>(context, listen: false);
    var state = Provider.of<DrawerProvider>(context, listen: false);
    await state.getPrivacyPolicy(userdata.user?.data?.token);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, draw, child) {
        return Scaffold(
          appBar: AppBar(),
          body: draw.loadingprivacy == true
              // ignore: prefer_const_constructors
              ? Center(
                  child: const CircularProgressIndicator(
                  color: AppColors.primarybrown,
                ))
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${draw.privacy?.data?.privacyPolicy?.privacyHeading}',
                          style: authenticationtitlestyle,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        HtmlWidget(draw.privacy?.data?.privacyPolicy
                                ?.privacyDescription ??
                            '')
                        // Text(
                        //   '${draw.privacy?.data?.privacyPolicy?.privacyDescription}',
                        //   style: aboutustyle,
                        // ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
