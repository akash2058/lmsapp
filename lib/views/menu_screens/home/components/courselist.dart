import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/utilities/appimages.dart';

class PopularCourseList extends StatelessWidget {
  const  PopularCourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              3,
              (index) => Row(
                    children: [
                      CoursesCard(
                        img: AppImages.cardback,
                        coursetitle: 'Graphic Design',
                        lessons: '9 Lessons',
                        duration: '78 hrs 30 min',
                        discount: '30% OFF',
                        discountprice: '5000',
                        price: 'INR 3,500',
                        title: 'Expert Wireframing for Mobile Design',
                      ),
                      SizedBox(
                        width: 20.w,
                      )
                    ],
                  ))),
    );
  }
}
