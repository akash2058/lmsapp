import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customsearch.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/bottom_sheet/lmsbottomsheet.dart';
import 'package:lmsapp/views/bottom_sheet/provider/bottomsheetprovider.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/courselandingpage/courselandingpage.dart';
import 'package:lmsapp/views/menu_screens/home/searchscreen.dart';
import 'package:lmsapp/views/notification/lms_notification.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CourseSearchPage extends StatefulWidget {
  const CourseSearchPage({
    super.key,
  });

  @override
  State<CourseSearchPage> createState() => _CourseSearchPageState();
}

class _CourseSearchPageState extends State<CourseSearchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadsearchdata();
    });
  }

  void loadsearchdata() async {
    var state = Provider.of<BottomsheetProvider>(context, listen: false);
    var menu = Provider.of<MenuProviders>(context, listen: false);
    await state.getSearchCourse();
    await menu.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    var menu = Provider.of<MenuProviders>(context, listen: false);
    return Consumer<BottomsheetProvider>(
      builder: (context, bottom, child) {
        var state = Provider.of<MenuProviders>(context, listen: false);
        return Scaffold(
          appBar: CustomAppbar(
            autoapply: true,
            title: '',
            actions: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${state.profile?.data?.baseurl}/${state.profile?.data?.photo}')),
                  shape: BoxShape.circle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, CustomPageRoute(child: const LmsNotifcation()));
                },
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 11.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primarylightgrey)),
                    child: Badge(
                        largeSize: 18.sp,
                        textStyle: Linethroughtgreystyle,
                        label: Text(
                            menu.notification?.data?.length.toString() ?? '0'),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          size: 25.sp,
                        ))),
              )
            ],
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 28.w),
              child: bottom.loadingsearchcourse == true
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomSearchField(
                                onTap: () {
                                  if (state.mycourse?.data != null) {
                                    showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate(state
                                          .mycourse!
                                          .data!), // Trigger search directly
                                    );
                                  }
                                },
                                prefix: SvgPicture.asset(
                                  SvgImages.search,
                                  height: 24.h,
                                ),
                                hint: 'Search any thing',
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const LmsBottomSheet();
                                      });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primarylightgrey),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 18.h, horizontal: 16.w),
                                    child: SvgPicture.asset(
                                      SvgImages.bottomsheetimg,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(
                            'Search Result',
                            style: titleStyle,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          bottom.searchCourse?.data?.course?.isEmpty ?? true
                              ? Center(
                                  child: Text(
                                    'No Search Found !!!',
                                    style: pricestyle,
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                      bottom.searchCourse?.data?.course
                                              ?.length ??
                                          0, (index) {
                                    var data = bottom
                                        .searchCourse?.data?.course?[index];

                                    int coursePrice = data?.coursePrice ?? 0;
                                    int salePrice = data?.salePrice ?? 0;

                                    int discountAmount =
                                        coursePrice - salePrice;
                                    double percentage =
                                        (discountAmount / coursePrice) * 100;
                                    String onlypercent =
                                        percentage.toStringAsFixed(0);
                                    String convertMinutesToHours(int minutes) {
                                      int hours = minutes ~/ 60;
                                      int remainingMinutes = minutes % 60;
                                      String result = '$hours hrs';
                                      if (remainingMinutes > 0) {
                                        result += ' $remainingMinutes min';
                                      }
                                      return result;
                                    }

                                    String? courseTime = bottom.searchCourse
                                        ?.data?.course?[index].courseTime
                                        .toString();

                                    // Parse courseTime to int using int.tryParse()
                                    int? minutes =
                                        int.tryParse(courseTime ?? '');

                                    if (minutes != null) {
                                      convertMinutesToHours(minutes);
                                    } else {}
                                    return CoursesCard(
                                      img:
                                          '${bottom.searchCourse?.data?.imageBaseUrl}/${data?.image}',
                                      coursetitle: data?.title ?? '',
                                      lessons:
                                          '${data?.totalLesson ?? '0'}lessons',
                                      duration:
                                          convertMinutesToHours(minutes ?? 0),
                                      discount: onlypercent,
                                      discountprice:
                                          '₹${data?.salePrice ?? ''}',
                                      price: '₹${data?.coursePrice ?? ''}',
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CustomPageRoute(
                                                child: CourseLandingPage(
                                                    id: data?.id.toString() ??
                                                        '')));
                                      },
                                      title: data?.metaTitle ?? '',
                                    );
                                  }),
                                ),
                        ],
                      ),
                    )),
        );
      },
    );
  }
}
