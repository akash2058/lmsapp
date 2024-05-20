import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CourseDetailCard extends StatelessWidget {
  String coursetitle;
  String title;
  String duration;
  String lessons;
  String name;
  String ratings;
  String img;
  CourseDetailCard(
      {super.key,
      required this.coursetitle,
      required this.title,
      required this.duration,
      required this.lessons,
      required this.name,
      required this.ratings,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(),
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
            style: titleStyle,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Text(
                duration,
                style: itemsfont,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.circle,
                size: 4.h,
                color: AppColors.primarygrey,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                lessons,
                style: itemsfont,
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight, image: NetworkImage(img)),
                        shape: BoxShape.circle,
                        color: AppColors.hintextcolor),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Text(
                    name,
                    style: otherstyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.primaryellow,
                    size: 16.h,
                  ),
                  Text(
                    ratings,
                    style: jakratafontblack,
                  ),
                  Text(
                    '(55 Reviews)',
                    style: ratinggrey,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
