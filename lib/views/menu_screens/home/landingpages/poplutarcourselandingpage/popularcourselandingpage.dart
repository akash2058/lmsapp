import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customexpansiontile.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/cart/cart_provider/cart_provider.dart';
import 'package:lmsapp/views/menu_screens/cart/cartscreen.dart';
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
    var cart = Provider.of<CartProvider>(context, listen: false);

    await state.getCourseDetails(widget.id);
    await cart.getCartData();
  }

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthenticationProvider>(context, listen: false);
    var state = Provider.of<CartProvider>(context, listen: false);
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
                  '₹${get.course?.data?.course?.coursePrice ?? ''}',
                  style: titlestyle,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: CustomButton(
                        height: 53.h,
                        text: state.loadingaddtocart == true
                            ? 'Adding...'
                            : 'Add to Cart',
                        onTap: () {
                          if (get.course?.data?.course?.id.toString() ==
                              auth.userid) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Already Added')));
                          } else {
                            state.getaddcart(widget.id, context);
                          }
                        }))
              ],
            ),
          ),
          appBar: CustomAppbar(actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const CartScreen()));
              },
              child: Consumer<CartProvider>(builder: (context, get, child) {
                return Badge(
                  largeSize: 20,
                  backgroundColor: AppColors.primarybrown,
                  label: Text(get.cartItems.toString(), style: buttonstyle),
                  child: SvgPicture.asset(
                    SvgImages.cart,
                    height: 35.h,
                    // ignore: deprecated_member_use
                    color: AppColors.primarygrey,
                  ),
                );
              }),
            ),
            SizedBox(
              width: 20.w,
            )
          ], autoapply: true, title: 'Course Details'),
          body: get.loadingcoursedetails == true
              // ignore: prefer_const_constructors
              ? CircularProgressIndicator()
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
                              coursetitle:
                                  get.course?.data?.course?.metaTitle ?? '',
                              title: 'Expert Wireframing for Mobile Design',
                              duration:
                                  convertMinutesToHours(minutes?.toInt() ?? 0),
                              lessons:
                                  '${get.course?.data?.course?.playlistCount} lessons',
                              name: get.course?.data?.course?.userName ?? '',
                              ratings: '5',
                              img:
                                  '${get.course?.data?.userProfileUrl}/${get.course?.data?.course?.userImage}',
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            AboutCourseCard(
                              description:
                                  get.course?.data?.course?.description ?? '',
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
                                    duration: data?.createdAt ?? '',
                                    lessontitle: data?.title ?? '',
                                    children: List.generate(
                                        data?.videoContent?.length ?? 0,
                                        (index) {
                                      var getdata = data?.videoContent?[index];
                                      return Customlessontext(
                                          ontap: () {
                                            if (getdata!.url!.contains('www.youtube.com')) {}
                                          },
                                          title: getdata?.url ?? '');
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
