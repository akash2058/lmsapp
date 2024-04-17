import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: pricefont,
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 24.h,
          ),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            CartCard(),
            CartCard(),
            CartCard(),
            Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Payment',
                      style: reviewfont,
                    ),
                    Text(
                      'INR 8,640',
                      style: onboardtitle,
                    ),
                  ],
                ),
                CustomButton(text: 'CheckOut', onTap: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      width: MediaQuery.sizeOf(context).width,
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.bordercolor)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              SizedBox(
                width: 12.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UI/UX',
                      style: coursetitlefont,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Expert Wireframing for Mobile..',
                      style: titlestyle,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'INR 4,800',
                          style: titleStyle,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryred,
                                shape: BoxShape.circle),
                            padding: EdgeInsets.all(6.5.sp),
                            child: Icon(
                              Icons.delete,
                              color: AppColors.primarywhite,
                              size: 18.h,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
