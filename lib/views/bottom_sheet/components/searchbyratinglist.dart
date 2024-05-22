import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/bottom_sheet/provider/bottomsheetprovider.dart';
import 'package:provider/provider.dart';

class SearchByRatings extends StatelessWidget {
  const SearchByRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomsheetProvider>(
      builder: (context, bottom, child) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(bottom.starratinglist.length, (index) {
              return GestureDetector(
                onTap: () {
                  bottom.selectstarlist(bottom.starratinglist[index]);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                      color: bottom.selectstar == bottom.starratinglist[index]
                          ? AppColors.formfillcolor
                          : AppColors.primarywhite,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.primarybrown,
                      )),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryellow,
                        size: 16.h,
                      ),
                      Text(
                        bottom.starratinglist[index],
                        style: jakratafontblack,
                      )
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }
}
