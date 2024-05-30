import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
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
  MenuProviders? _menuProviders;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _menuProviders ??= Provider.of<MenuProviders>(context, listen: false);
    loadWishlist();
  }

  void loadWishlist() async {
    _menuProviders?.getWishlistData();
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
                child: get.wishlist?.data?.wishlistItems?.isEmpty ?? true
                    ? Center(
                        child: Text(
                          'Empty Wishlist Items !!!',
                          style: pricestyle,
                        ),
                      )
                    : Column(
                        children: [
                          Column(
                            children: List.generate(
                                get.wishlist?.data?.wishlistItems?.length ?? 0,
                                (index) {
                              var data =
                                  get.wishlist?.data?.wishlistItems?[index];
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

                              int? minutes = int.tryParse(courseTime);

                              if (minutes != null) {
                                convertMinutesToHours(minutes);
                              }

                              return Column(
                                children: [
                                  WishListCard(
                                    remove: () {
                                      BuildContext dialogContext = context;
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Are You Sure Do You Want Delete ?',
                                              style: titlestyle,
                                            ),
                                            actions: [
                                              CustomSmallButton(
                                                text: 'No',
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              CustomSmallButton(
                                                text: 'Yes',
                                                onTap: () {
                                                  get.getRemoveWishlist(
                                                      data?.id.toString() ?? '',
                                                      dialogContext,
                                                      index);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CustomPageRoute(
                                              child: PopularCourseLandingPage(
                                            id: data?.courseId.toString() ?? '',
                                          )));
                                    },
                                    title: data?.categoryTitle ?? '',
                                    coursetitle: data?.categoryTitle ?? '',
                                    lesson:
                                        '${data?.totalPlaylists ?? ''} Lessons',
                                    duration: convertMinutesToHours(
                                        minutes?.toInt() ?? 0),
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
