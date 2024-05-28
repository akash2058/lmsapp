import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:lmsapp/views/menu_screens/profie/components/wishlistcard.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadWishlist();
    });
  }

  void loadWishlist() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    state.getWishlistData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(builder: (context, get, child) {
      return Scaffold(
        backgroundColor: AppColors.secondarylight,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Wish List',
            style: appbartitlestyle,
          ),
        ),
        body: get.loadinggetwishlist == true
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(get.wishlistitems, (index) {
                        var data = get.wishlist?.data?.wishlistItems?[index];
                        String convertMinutesToHours(int minutes) {
                          int hours = minutes ~/ 60;
                          int remainingMinutes = minutes % 60;
                          String result = '$hours hrs';
                          if (remainingMinutes > 0) {
                            result += ' $remainingMinutes min';
                          }
                          return result;
                        }

                        String? courseTime = get.wishlist?.data
                                ?.wishlistItems?[index].courseTime ??
                            '';

                        // Parse courseTime to int using int.tryParse()
                        int? minutes = int.tryParse(courseTime);

                        if (minutes != null) {
                          convertMinutesToHours(minutes);
                        } else {}
                        return Column(
                          children: [
                            WishListCard(
                              remove: () {
                                get.getRemoveWishlist(
                                    data?.id.toString() ?? '', context, index);
                              },
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CustomPageRoute(
                                        child: PopularCourseLandingPage(
                                      id: data?.id.toString() ?? '',
                                    )));
                              },
                              title: data?.categoryTitle ?? '',
                              coursetitle: data?.categoryTitle ?? '',
                              lesson: '${data?.totalPlaylists ?? ''} Lessons',
                              duration:
                                  convertMinutesToHours(minutes?.toInt() ?? 0),
                              img:
                                  '${get.wishlist?.data?.imageBaseUrl ?? ''}/${data?.courseImage ?? ''}',
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        );
                      }),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 16.h,
                    )
                  ],
                ),
              ),
      );
    });
  }
}

// ignore: must_be_immutable
