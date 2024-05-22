import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/bottom_sheet/provider/bottomsheetprovider.dart';
import 'package:provider/provider.dart';

class GategoryButtonList extends StatelessWidget {
  const GategoryButtonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomsheetProvider>(
      builder: (context, bottom, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children:
                  List.generate(bottom.gategory?.data?.length ?? 0, (index) {
            var data = bottom.gategory?.data?[index];
            return Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.2.w,
                        color: AppColors.primarybrown,
                      ),
                      color: AppColors.primarybrown,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Text(
                    data?.title ?? '',
                    style: gategorybuttonwhite,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                )
              ],
            );
          })),
        );
      },
    );
  }
}
