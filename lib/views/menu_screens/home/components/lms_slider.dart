import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';

import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/components/slider_indicator.dart';
import 'package:provider/provider.dart';

class LmsSlider extends StatefulWidget {
  const LmsSlider({
    super.key,
  });

  @override
  State<LmsSlider> createState() => _LmsSliderState();
}

class _LmsSliderState extends State<LmsSlider> {
  late PageController pageController;
  int currentslide = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // startAutoPageChange();
  }

  // void startAutoPageChange() {
  //   var state = Provider.of<MenuProviders>(context, listen: false);

  //   Timer.periodic(const Duration(seconds: 2), (Timer timer) {
  //     if (currentslide < state.home?.data?.homeBanner?.length - 1) {
  //       currentslide++;
  //     } else {
  //       currentslide = 0;
  //     }
  //     if (pageController.hasClients) {
  //       pageController.animateToPage(
  //         currentslide,
  //         duration: const Duration(milliseconds: 500),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, slider, child) {
        return Column(
          children: [
            SizedBox(
              height: 150.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: PageView.builder(
                  itemCount: slider.home?.data?.homeBanner?.length ?? 0,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentslide = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    var slides = slider.home?.data?.homeBanner?[index];
                    return Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${slider.home?.data?.baseUrl}/${slider.home?.data?.homeBanner?[index].image}')),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'All Course',
                              style: resendotpstyle,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              slides?.title ?? '',
                              style: titlestyle,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              '${slides?.playlistsCount ?? '0'}/25 Lesson',
                              style: resendotpstyle,
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slider.home?.data?.homeBanner?.length ?? 0,
                  (index) => Row(
                    children: [
                      Container(
                        height: 8.h,
                        width: currentslide == index ? 25.w : 8.w,
                        decoration: BoxDecoration(
                            borderRadius: currentslide == index
                                ? BorderRadius.circular(10.r)
                                : null,
                            color: currentslide == index
                                ? AppColors.primarybrown
                                : AppColors.formfillcolor,
                            shape: currentslide == index
                                ? BoxShape.rectangle
                                : BoxShape.circle),
                      ),
                      SizedBox(
                        width: 5.w,
                      )
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }
}
