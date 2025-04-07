import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String img;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 56.h,
                width: 56.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: CachedNetworkImage(
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.fallingDot(
                              color: AppColors.primarybrown, size: 20.h),
                      fit: BoxFit.fill,
                      imageUrl: img),
                )),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: titlestyle,
                ),
                Text(
                  email,
                  style: normaltextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
