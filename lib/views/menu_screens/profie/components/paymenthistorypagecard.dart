// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class PaymentHistoryCard extends StatelessWidget {
  String coursetitle;
  String date;
  String time;
  String price;
  String img;
  PaymentHistoryCard(
      {super.key,
      required this.coursetitle,
      required this.date,
      required this.price,
      required this.img,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(width: 2.w, color: AppColors.primarylightgrey)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(fit: BoxFit.fill, img),
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coursetitle,
                  style: appbartitlestyle,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '${date} ${time}',
                  style: anotherjakratafont,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: paymentpricestyle,
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 30.h,
                      color: AppColors.secondarygreen,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
