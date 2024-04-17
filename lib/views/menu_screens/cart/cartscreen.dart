import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';

import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/cart/components/coursecartcard.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 130.h,
        child: Column(
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
            SizedBox(
              height: 16.h,
            ),
            CustomButton(height: 53.h, text: 'CheckOut', onTap: () {})
          ],
        ),
      ),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    4,
                    (index) => Column(
                      children: [
                        CartCard(
                          coursetitle: 'UI/UX',
                          price: '4800',
                          title: 'Expert Wireframing for Mobile.',
                          img: AppImages.imgone,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(hint: 'Coupon Code'),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: CustomButton(
                            height: 53.h, text: 'Apply', onTap: () {}))
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items',
                      style: itemsfont,
                    ),
                    Text(
                      'INR 10,800',
                      style: otherfont,
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discounts',
                      style: itemsfont,
                    ),
                    Text(
                      '20%',
                      style: otherfont,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            )
          ],
        ),
      ),
    );
  }
}
