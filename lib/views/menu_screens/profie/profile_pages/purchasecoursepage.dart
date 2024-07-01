import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/components/custom_upcomming_testcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/upcomingtestlandingpage/upcomingtestlandingpage.dart';
import 'package:lmsapp/views/menu_screens/profie/components/purchasecard.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/landingpages/purchasedcourselandingpage.dart';
import 'package:provider/provider.dart';

class PurchaseCoursePage extends StatefulWidget {
  const PurchaseCoursePage({super.key});

  @override
  State<PurchaseCoursePage> createState() => _PurchaseCoursePageState();
}

class _PurchaseCoursePageState extends State<PurchaseCoursePage> {
  int currentstate = 0;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadpurchasedata();
    });
  }

  void loadpurchasedata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);

    await state.getMyCourse();
    await state.getUpComingTest();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Scaffold(
          appBar: CustomAppbar(
            autoapply: true,
            title: 'Purchase History',
          ),
          body: main.loadingmycourses == true
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentstate = 0;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentstate == 0
                                        ? AppColors.primarybrown
                                        : AppColors.primarylightgrey),
                                color: currentstate == 0
                                    ? AppColors.primarybrown
                                    : AppColors.primarywhite,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Text(
                                'My Course',
                                style: currentstate == 0
                                    ? gategorybuttonwhite
                                    : gategorybuttonblack,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentstate = 1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentstate == 1
                                        ? AppColors.primarybrown
                                        : AppColors.primarylightgrey),
                                borderRadius: BorderRadius.circular(50.r),
                                color: currentstate == 1
                                    ? AppColors.primarybrown
                                    : AppColors.primarywhite,
                              ),
                              child: Text(
                                'UpComing Test',
                                style: currentstate == 1
                                    ? gategorybuttonwhite
                                    : gategorybuttonblack,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      if (currentstate == 0)
                        Column(
                          children: List.generate(
                              main.mycourse?.data?.length ?? 0, (index) {
                            var data = main.mycourse?.data?[index];
                            return PurchaseCourseCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CustomPageRoute(
                                        child: PurchasedCourseLandingPage(
                                      coursename: data?.courseTitle ?? '',
                                      id: data?.id.toString() ?? '',
                                    )));
                              },
                              coursetitle: data?.courseTitle ?? '',
                              lesson: '${data?.lesson} Lessons',
                              img: '${data?.baseUrl}/${data?.courseImage}',
                              duration: '${data?.duration}',
                              number: '18',
                              value: 0.6,
                            );
                          }),
                        ),
                      if (currentstate == 1)
                        Expanded(
                          child: main.loadingupcomingtest == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GridView.builder(
                                  itemCount: main.upcomingtest?.data?.allTest
                                          ?.length ??
                                      0,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 14.h,
                                          childAspectRatio: 0.65,
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 14.w),
                                  itemBuilder: (context, index) {
                                    var data = main
                                        .upcomingtest?.data?.allTest?[index];
                                    return UpcomingTestCard(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CustomPageRoute(
                                                  child:
                                                      UpComingTestLandingpage(
                                                quizid: '${data?.id}',
                                                title: '${data?.title}',
                                              )));
                                        },
                                        duration: '${data?.numOfAttemp}',
                                        title: '${data?.title}',
                                        marks: '${data?.passPercent}',
                                        img:
                                            '${main.upcomingtest?.data?.imageBaseUrl}/${data?.courseImage}',
                                        questions: '${data?.questions}');
                                  }),
                        )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
