import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/courselandingpage/courselandingpage.dart';
import 'package:provider/provider.dart';

class FeaturedCourse extends StatelessWidget {
  const FeaturedCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Row(
          children: List.generate(main.home?.data?.featuredCourse?.length ?? 0,
              (index) {
            var data = main.home?.data?.featuredCourse?[index];
            int coursePrice = data?.coursePrice ?? 0;
            int salePrice = data?.salePrice ?? 0;

            // Calculate discount amount and percentage
            int discountAmount = coursePrice - salePrice;
            double percentage = (discountAmount / coursePrice) * 100;
            String discountpercent = percentage.toStringAsFixed(0);

            String convertMinutesToHours(int minutes) {
              int hours = minutes ~/ 60;
              int remainingMinutes = minutes % 60;
              String result = '$hours hrs';
              if (remainingMinutes > 0) {
                result += ' $remainingMinutes min';
              }
              return result;
            }

            String? courseTime = data?.courseTime.toString();
            int? minutes = int.tryParse(courseTime ?? '');

            return CoursesCard(
              img: '${main.home?.data?.baseUrl}/${data?.image}',
              coursetitle: data?.category.toString() ?? '',
              lessons: '${data?.playlistsCount} lessons',
              duration:
                  minutes != null ? convertMinutesToHours(minutes) : 'N/A',
              discount: '$discountpercent% off',
              discountprice: '${data?.coursePrice}',
              price: '₹${data?.salePrice}',
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(
                    child: CourseLandingPage(
                      id: data?.id.toString() ?? '',
                    ),
                  ),
                );
              },
              title: '${data?.title}',
              child: GestureDetector(
                onTap: () {
                  main.getaddwishlist(data?.id.toString() ?? '', context);
                },
                child: Icon(
                  main.wishlistFeaturedStatus[data?.id.toString()] == true
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  size: 24.h,
                  color:
                      main.wishlistFeaturedStatus[data?.id.toString()] == true
                          ? AppColors.primaryred
                          : AppColors.primaryblack,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
