import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class ReviewCard extends StatelessWidget {
  String studentname;
  String duration;
  String ratings;
  String givereview;
  String image;
  ReviewCard(
      {super.key,
      required this.duration,
      required this.givereview,
      required this.ratings,
      required this.studentname,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.primarywhite,
          border: Border.all(color: AppColors.secondarygrey, width: 0.2.w)),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight, image: AssetImage(image)),
                      color: AppColors.primarygrey,
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            studentname,
                            style: titlestyle,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primaryellow,
                                size: 16.h,
                              ),
                              Text(
                                ratings,
                                style: jakratafontblack,
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        duration,
                        style: testdetailstyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              givereview,
              style: reviewfont,
            )
          ],
        ),
      ),
    );
  }
}
