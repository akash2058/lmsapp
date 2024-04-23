import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:lmsapp/views/menu_screens/profie/components/wishlistcard.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: CustomButton(
          height: 53.h,
          text: 'Back To HomePage',
          onTap: () {},
        ),
      ),
      backgroundColor: AppColors.secondarylight,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Wish List',
          style: appbartitlestyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
        child: Column(
          children: [
            Column(
              children: List.generate(
                  3,
                  (index) => Column(
                        children: [
                          WishListCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CustomPageRoute(
                                      child: const PopularCourseLandingPage()));
                            },
                            title: 'Expert Wireframing for Mobile...',
                            coursetitle: 'Graphic Design',
                            lesson: '9 Lessons',
                            duration: '78 hrs 30 mins',
                            img: AppImages.imgone,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      )),
            ),
            Spacer(),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
