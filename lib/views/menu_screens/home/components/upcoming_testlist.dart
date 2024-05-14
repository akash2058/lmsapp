import 'package:flutter/cupertino.dart';

import 'package:lmsapp/customwidgets/customcard.dart';

import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
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
            discountpercent =
                discountpercent.substring(0, discountpercent.length - 0);

            return CoursesCard(
                img: '${main.home?.data?.baseUrl}/${data?.image}',
                coursetitle: main.home?.data?.featuredCourse?[index].category
                        .toString() ??
                    '',
                lessons:
                    '${main.home?.data?.featuredCourse?[index].playlistsCount} lessons',
                duration: '${data?.courseTime} min',
                discount: 'off$discountpercent',
                discountprice: '${data?.salePrice}',
                price:
                    'INR ${main.home?.data?.featuredCourse?[index].coursePrice}',
                onTap: () {},
                title: '${data?.title}');
          }),
        );
      },
    );
  }
}
