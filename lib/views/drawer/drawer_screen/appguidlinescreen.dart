import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/views/drawer/drawer_screen/components/guidlinestitlecard.dart';

class AppGuideLineScreen extends StatelessWidget {
  const AppGuideLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'FAQ', autoapply: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
        child: Column(
            children: List.generate(
          5,
          (index) => Column(
            children: [
              GuidelineTitles(
                title: 'How to Chat with Tutor during live classes.',
              ),
              SizedBox(
                height: 26.h,
              )
            ],
          ),
        )),
      ),
    );
  }
}


