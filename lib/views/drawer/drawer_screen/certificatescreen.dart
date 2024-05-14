import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/utilities/appimages.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          autoapply: true,
          actions: [
            Icon(Icons.more_horiz),
            SizedBox(
              width: 20.w,
            )
          ],
          title: 'Achievements and Certificates'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            Container(
              height: 264.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.certificate))),
            )
          ],
        ),
      ),
    );
  }
}
