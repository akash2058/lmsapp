import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/textstyle.dart';

import '../../../../utilities/appcolors.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  String coursetitle;
  String title;
  String price;
  String img;
  VoidCallback? ontap;
  CartCard(
      {super.key,
      required this.coursetitle,
      required this.price,
      this.ontap,
      required this.title,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.bordercolor)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight, image: NetworkImage(img)),
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
                        coursetitle,
                        style: coursetitlefont,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        title,
                        style: titlestyle,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: titleStyle,
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryred,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.all(6.5.sp),
                              child: Icon(
                                CupertinoIcons.delete,
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
      ),
    );
  }
}
