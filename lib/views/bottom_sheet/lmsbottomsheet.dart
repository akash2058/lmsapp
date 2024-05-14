import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/bottom_sheet/components/gategorybuttonlist.dart';
import 'package:lmsapp/views/bottom_sheet/components/searchbyratinglist.dart';

class LmsBottomSheet extends StatelessWidget {
  const LmsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 490.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
          color: AppColors.primarywhite),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 4.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      color: AppColors.primarygrey,
                      borderRadius: BorderRadius.circular(50.r)),
                ),
              ),
            ),
            Text(
              'Category',
              style: titlestyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            const GategoryButtonList(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Search By',
              style: titlestyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomFormField(
                suffix: const Icon(Icons.arrow_drop_down_outlined), hint: 'By Class'),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Search By',
              style: titlestyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            const SearchByRatings(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Price',
              style: titlestyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            // SizedBox(
            //   height: 76.h,
            //   width: MediaQuery.sizeOf(context).width,
            //   child: BarChart(BarChartData(barGroups: List.generate(5, (index) => BarChartRodData(toY:20,color: AppColors.primarygrey))

            //   )),
            // )
          ],
        ),
      ),
    );
  }
}
