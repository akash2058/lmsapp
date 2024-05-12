import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/%20customitemdiscount.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customitemprice.dart';
import 'package:lmsapp/customwidgets/custompaymentcard.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 155.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28.w,
          ),
          child: Column(
            children: [
              CustomPaymentCard(
                amount: 'INR 8400',
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                  height: 53.h,
                  text: 'Purchase Now',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 52.h),
                            title: Container(
                              height: 153.h,
                              width: 153.w,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image:
                                          AssetImage(AppImages.successlogo))),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Payment Successfully',
                                  style: titleStyle,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Transaction Number : 12345678',
                                  style: itemsfont,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Amount paid:',
                                      style: titlestyle,
                                    ),
                                    Text(
                                      '\$40',
                                      style: pricestyle,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Payed By:',
                                      style: payedstyle,
                                    ),
                                    Text(
                                      '***8446',
                                      style: itemsfont,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 66.h,
                                ),
                                CustomButton(
                                    width: MediaQuery.sizeOf(context).width,
                                    text: 'Back To HomePage',
                                    onTap: () {
                                      Navigator.pop(context);
                                    }),
                                SizedBox(
                                  height: 20.h,
                                )
                              ],
                            ),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
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
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 10.h),
                      trailing: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.primarygrey,
                      ),
                      leading: Icon(
                        Icons.wallet,
                        size: 24.h,
                        color: AppColors.primarygrey,
                      ),
                      title: Text(
                        'Credit Card',
                        style: itemsfont,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 10.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: const BorderSide(color: AppColors.bordercolor)),
                      trailing: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.primarygrey,
                      ),
                      leading: SvgPicture.asset(
                        SvgImages.master,
                      ),
                      title: Text(
                        '•••• 7658',
                        style: itemsfont,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 10.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: const BorderSide(color: AppColors.bordercolor)),
                      trailing: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.primarygrey,
                      ),
                      leading: SvgPicture.asset(
                        SvgImages.visa,
                      ),
                      title: Text(
                        '•••• 2322',
                        style: itemsfont,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    DottedBorder(
                      dashPattern: [8],
                      color: AppColors.primarybrown,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 16.h,
                                color: AppColors.primarybrown,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Add new Card',
                                style: dotedborderstyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
