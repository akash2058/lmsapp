import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customexpansiontile.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/aboutcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/coursereviewlist.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/customlessontext.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/coursedetailcard.dart';
import 'package:provider/provider.dart';

import 'components/landingpagehead.dart';

// ignore: must_be_immutable
class PopularCourseLandingPage extends StatefulWidget {
  String id;
  PopularCourseLandingPage({super.key, required this.id});

  @override
  State<PopularCourseLandingPage> createState() =>
      _PopularCourseLandingPageState();
}

class _PopularCourseLandingPageState extends State<PopularCourseLandingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      coursedetails();
    });
  }

  void coursedetails() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getCourseDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, get, child) {
        String convertMinutesToHours(int minutes) {
          int hours = minutes ~/ 60;
          int remainingMinutes = minutes % 60;
          String result = '$hours hrs';
          if (remainingMinutes > 0) {
            result += ' $remainingMinutes min';
          }
          return result;
        }

        String? courseTime = get.course?.data?.course?.courseTime?.toString();

        // Parse courseTime to int using int.tryParse()
        int? minutes = int.tryParse(courseTime ?? '');

        if (minutes != null) {
          convertMinutesToHours(minutes);
        } else {}
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            child: Row(
              children: [
                Text(
                  '\$${get.course?.data?.course?.coursePrice}',
                  style: titlestyle,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: CustomButton(
                        height: 53.h, text: 'Add to Cart', onTap: () {}))
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Course Detail', style: appbartitlestyle),
          ),
          body: get.loadingcoursedetails == true
              // ignore: prefer_const_constructors
              ? LinearProgressIndicator(
                  color: AppColors.primarybrown,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      LandingPageHead(
                          img:
                              '${get.home?.data?.baseUrl ?? ''}/${get.course?.data?.course?.image ?? ''}'),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 28.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CourseDetailCard(
                              coursetitle: get.course?.data?.course?.metaTitle
                                      .toString() ??
                                  '',
                              title: 'Expert Wireframing for Mobile Design',
                              duration:
                                  convertMinutesToHours(minutes?.toInt() ?? 0),
                              lessons:
                                  '${get.course?.data?.course?.playlistCount} lessons',
                              name: get.course?.data?.course?.userName
                                      .toString() ??
                                  '',
                              ratings: '5',
                              img:
                                  '${get.course?.data?.userProfileUrl}/${get.course?.data?.course?.userImage}',
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            AboutCourseCard(
                              description: get.course?.data?.course?.description
                                      .toString() ??
                                  '',
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              'Lessons',
                              style: titlestyle,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              'Please finish the lessons step by step',
                              style: itemsfont,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Column(
                              children: List.generate(
                                  get.course?.data?.playlist?.length ?? 0,
                                  (index) {
                                var data = get.course?.data?.playlist?[index];
                                return CustomExpansionTile(
                                    lessonnum: index.bitLength.toString(),
                                    duration: data?.createdAt.toString() ?? '',
                                    lessontitle: data?.title.toString() ?? '',
                                    children: List.generate(
                                        data?.videoContent?.length ?? 0,
                                        (index) {
                                      var getdata = data?.videoContent?[index];
                                      return Customlessontext(
                                          title: '${getdata?.title}');
                                    }));
                              }),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              'Review',
                              style: titlestyle,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            const CourseReviewList()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
