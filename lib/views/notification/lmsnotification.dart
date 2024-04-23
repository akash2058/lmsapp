import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';

class LmsNotifcation extends StatelessWidget {
  const LmsNotifcation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        autoapply: true,
        title: 'Notifications',
        actions: [
          Icon(Icons.more_horiz),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            CustomTile(
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text(''), Text('28 Mar, 2024 06:57 PM')],
                ),
                leading: Icon(
                  Icons.circle,
                  size: 24.h,
                  color: AppColors.primarybrown,
                ),
                title: 'Notifcations',
                subtitle: 'Ringtone, message, notification'),
            SizedBox(
              height: 20.h,
            ),
            CustomTile(
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text(''), Text('28 Mar, 2024 06:57 PM')],
                ),
                leading: Icon(
                  Icons.circle,
                  size: 24.h,
                  color: AppColors.primarybrown,
                ),
                title: 'Notifcations',
                subtitle: 'Ringtone, message, notification'),
          ],
        ),
      ),
    );
  }
}
