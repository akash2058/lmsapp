import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Row(
            children: [
              Container(
                height: 8.h,
                width: 8.w,
                decoration: const BoxDecoration(
                    color: AppColors.primarybrown, shape: BoxShape.circle),
              ),
              SizedBox(
                width: 5.w,
              )
            ],
          ),
        ));
  }
}
