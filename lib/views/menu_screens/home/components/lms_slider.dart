import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/courselandingpage/courselandingpage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoPageChange();
    });
  }

  void startAutoPageChange() {
    var state = Provider.of<MenuProviders>(context, listen: false);
    if (state.home?.data?.homeBanner == null) return; // Add this null check

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentslide < state.home!.data!.homeBanner!.length - 1) {
        currentslide++;
      } else {
        currentslide = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentslide,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when disposing the widget
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, slider, child) {
        if (slider.home?.data?.homeBanner == null ||
            slider.home!.data!.homeBanner!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                child: CourseLandingPage(
                              id: slides?.id.toString() ?? '',
                            )));
                      },
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Stack(children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) =>
                                      LoadingAnimationWidget.fallingDot(
                                          color: AppColors.primarybrown,
                                          size: 30.h),
                                  imageUrl:
                                      '${slider.home?.data?.baseUrl}/${slides?.image ?? ''}'),
                            ),
                            Padding(
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
                          ])),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              width: 50.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slider.home?.data?.homeBanner?.length ?? 0,
                    (index) => Row(
                      children: [
                        AnimatedContainer(
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 500),
                          height: 8.h,
                          width: currentslide == index ? 25.w : 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            color: currentslide == index
                                ? AppColors.primarybrown
                                : AppColors.formfillcolor,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
