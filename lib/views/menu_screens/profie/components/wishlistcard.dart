import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WishListCard extends StatelessWidget {
  final String title;
  final String coursetitle;
  final String lesson;
  final String duration;
  final String img;

  final VoidCallback? onTap;
  final VoidCallback? remove;

  const WishListCard(
      {super.key,
      required this.title,
      required this.coursetitle,
      required this.lesson,
      required this.duration,
      required this.img,
      this.remove,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.primarywhite),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 86.h,
              width: 80.w,
              decoration: BoxDecoration(),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        LoadingAnimationWidget.fallingDot(
                            color: AppColors.primarybrown, size: 25.sp),
                    imageUrl: img,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 12.w,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: wishlistitle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SvgImages.activelesson),
                          SizedBox(
                            width: 6.5.w,
                          ),
                          Text(
                            lesson,
                            style: lessonfontt,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(SvgImages.clock),
                          SizedBox(
                            width: 6.5.w,
                          ),
                          Text(
                            duration,
                            style: lessonfontt,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          coursetitle,
                          style: coursetitlefont,
                        ),
                        GestureDetector(
                          onTap: remove,
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryred,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.all(6.5.sp),
                              child: Icon(
                                CupertinoIcons.delete,
                                color: AppColors.primarywhite,
                                size: 18.h,
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
