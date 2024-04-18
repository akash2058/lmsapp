import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/%20customitemdiscount.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customitemprice.dart';
import 'package:lmsapp/customwidgets/custompaymentcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';

import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/cart/components/coursecartcard.dart';
import 'package:lmsapp/views/menu_screens/cart/paymentscreen/paymentview.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: appbartitlestyle,
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
              child: SizedBox(
                height: 360.h,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CartCard(
                              coursetitle: 'UI/UX',
                              price: '4800',
                              title: 'Expert Wireframing for Mobile',
                              img: AppImages.imgone),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 50.h,
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
                CustomItemsPrice(amount: 'INR 8400', items: 'items'),
                SizedBox(
                  height: 12.h,
                ),
                CustomItemDiscount(discount: 'INR 8400', discountpercent: '20%')
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                CustomPaymentCard(amount: 'INR 8400'),
                SizedBox(
                  height: 13.h,
                ),
                CustomButton(
                    height: 53.h,
                    text: 'CheckOut',
                    onTap: () {
                      Navigator.push(
                          // ignore: prefer_const_constructors
                          context,
                          CustomPageRoute(child: PaymentScreen()));
                    })
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
