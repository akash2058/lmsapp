import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/home/components/addcoursecard.dart';
import 'package:lmsapp/views/menu_screens/home/components/customupcommingtestcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/upcomingtestlandingpage/upcomingtestlandingpage.dart';
import 'package:lmsapp/views/menucard/main_menu_providers.dart';
import 'package:provider/provider.dart';

class UpComingTestList extends StatelessWidget {
  const UpComingTestList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return SizedBox(
          height: 288.h,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: main.home?.data?.featuredCourse?.length ?? 0,
            itemBuilder: (context, index) {
              var data = main.home?.data?.featuredCourse?[index];
              int coursePrice = data?.coursePrice ?? 0;
              int salePrice = data?.salePrice ?? 0;

              // Calculate discount amount and percentage
              int discountAmount = coursePrice - salePrice;
              double percentage = (discountAmount / coursePrice) * 100;

              return CoursesCard(
                  img:
                      '${main.home?.data?.baseUrl}/${main.home?.data?.featuredCourse?[index].image}',
                  coursetitle: main.home?.data?.featuredCourse?[index].category
                          .toString() ??
                      '',
                  lessons:
                      '${main.home?.data?.featuredCourse?[index].playlistsCount} lessons',
                  duration:
                      '${main.home?.data?.featuredCourse?[index].courseTime} min',
                  discount: percentage.toString(),
                  discountprice:
                      '${main.home?.data?.featuredCourse?[index].salePrice}',
                  price:
                      'INR ${main.home?.data?.featuredCourse?[index].coursePrice}',
                  onTap: () {},
                  title: '${main.home?.data?.featuredCourse?[index].title}');
            },
          ),
        );
      },
    );
  }
}
