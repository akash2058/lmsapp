import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/components/review_card.dart';
import 'package:provider/provider.dart';

class AllStudentsReviews extends StatefulWidget {
  const AllStudentsReviews({super.key});

  @override
  State<AllStudentsReviews> createState() => _AllStudentsReviewsState();
}

class _AllStudentsReviewsState extends State<AllStudentsReviews> {
  @override
  void initState() {
    super.initState();
  }

  void loadingdata() {
    var state = Provider.of<MenuProviders>(context, listen: false);
    state.getHomedata(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Scaffold(
          appBar: CustomAppbar(autoapply: true, title: 'All Students Reviews'),
          body: main.loadinghomedata == true
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
                    child: Column(
                      children: List.generate(
                          main.home?.data?.reviews?.length ?? 0, (index) {
                        var data = main.home?.data?.reviews?[index];
                        return Column(
                          children: [
                            ReviewCard(
                              duration: data?.createdAt.toString() ?? '',
                              givereview: data?.review.toString() ?? '',
                              ratings: data?.stars.toString() ?? '',
                              studentname: 'Rodolfo Goode',
                              image: AppImages.imgone,
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
