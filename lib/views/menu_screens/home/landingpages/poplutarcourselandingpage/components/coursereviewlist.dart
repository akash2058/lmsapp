import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/components/review_card.dart';
import 'package:provider/provider.dart';

class CourseReviewList extends StatelessWidget {
  const CourseReviewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, get, child) {
        return Column(
          children:
              List.generate(get.course?.data?.reviews?.length ?? 0, (index) {
            var data = get.course?.data?.reviews?[index];
            return Column(
              children: [
                ReviewCard(
                    duration: data?.createdAt.toString() ?? '',
                    givereview: data?.review.toString() ?? '',
                    ratings: data?.stars.toString() ?? '',
                    studentname:
                        get.course?.data?.course?.userName.toString() ?? '',
                    image: AppImages.imgone),
                SizedBox(
                  height: 16.h,
                )
              ],
            );
          }),
        );
      },
    );
  }
}
