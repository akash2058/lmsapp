import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/home/components/review_card.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:provider/provider.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  List.generate(main.home?.data?.reviews?.length ?? 0, (index) {
                var data = main.home?.data?.reviews?[index];
                return Row(
                  children: [
                    ReviewCard(
                      duration: data?.createdAt.toString() ?? '',
                      givereview: data?.review.toString() ?? '',
                      ratings: data?.stars.toString() ?? '',
                      studentname: 'Rodolfo Goode',
                      image: AppImages.imgone,
                    ),
                    SizedBox(
                      width: 14.w,
                    )
                  ],
                );
              })),
        );
      },
    );
  }
}
