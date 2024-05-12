import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/home/components/review_card.dart';

class CourseReviewList extends StatelessWidget {
  const CourseReviewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => Column(
                children: [
                  ReviewCard(
                      duration: '6 days ago',
                      givereview:
                          "Lyn's straight-talking approach always makes the problem easier to tackle. This session helped me la",
                      ratings: '4.5',
                      studentname: 'Rodolfo Goode',
                      image: AppImages.imgone),
                  SizedBox(
                    height: 16.h,
                  )
                ],
              )),
    );
  }
}
