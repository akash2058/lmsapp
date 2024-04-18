import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/%20customitemdiscount.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customitemprice.dart';
import 'package:lmsapp/customwidgets/custompaymentcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: appbartitlestyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: titlestyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.bordercolor)),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    ListTile(
                      trailing: const Icon(Icons.arrow_drop_down_sharp),
                      leading: const Icon(Icons.wallet),
                      title: Text(
                        'Credit Card',
                        style: titlestyle,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(color: AppColors.bordercolor)),
                      trailing: const Icon(Icons.arrow_drop_down_sharp),
                      leading: const Icon(Icons.wallet),
                      title: Text(
                        'Credit Card',
                        style: titlestyle,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(color: AppColors.bordercolor)),
                      trailing: const Icon(Icons.arrow_drop_down_sharp),
                      leading: const Icon(Icons.wallet),
                      title: Text(
                        'Credit Card',
                        style: titlestyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Column(
              children: [
                CustomItemsPrice(
                  amount: 'INR 8400',
                  items: 'Items',
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomItemDiscount(
                  discount: 'INR 8400',
                  discountpercent: '20%',
                ),
                CustomPaymentCard(
                  amount: 'INR 8400',
                ),
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
                          CustomPageRoute(child: const PaymentScreen()));
                    })
              ],
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
