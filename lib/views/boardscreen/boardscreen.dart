import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menucard/main_menu_providers.dart';
import 'package:provider/provider.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  void initState() {
    var state = Provider.of<MenuProviders>(context, listen: false);
    super.initState();
    state.pageController = PageController();
    state.startAutoPageChange();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, menu, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Text(
                'Skip',
                style: skipbutton,
              ),
              SizedBox(
                width: 28.w,
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 35.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300.h,
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          menu.currentslide = value;
                        });
                      },
                      itemCount: menu.onboardimgs.length,
                      itemBuilder: (context, index) {
                        return CustomOnboardCard(
                          img: menu.onboardimgs[index],
                        );
                      }),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: List.generate(
                      menu.onboardtitle.length,
                      (index) => Text(
                            menu.currentslide == index
                                ? menu.onboardtitle[index]
                                : '',
                            style: onboardtitle,
                          )),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      menu.onboardetails.length,
                      (index) => SizedBox(
                            width: menu.currentslide == index ? 370.w : 0,
                            child: Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              menu.currentslide == index
                                  ? menu.onboardetails[index]
                                  : '',
                              style: anotherormaltextStyle,
                            ),
                          )),
                ),
                SizedBox(
                  height: 42.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      menu.onboardimgs.length,
                      (index) => Row(
                            children: [
                              Container(
                                height: 9.h,
                                width: menu.currentslide == index ? 48.w : 9.w,
                                decoration: BoxDecoration(
                                    borderRadius: menu.currentslide == index
                                        ? BorderRadius.circular(
                                            50.r) // Or any appropriate value
                                        : null,
                                    shape: menu.currentslide == index
                                        ? BoxShape.rectangle
                                        : BoxShape.circle,
                                    color: menu.currentslide == index
                                        ? AppColors.primarybrown
                                        : AppColors.primaryacent),
                              ),
                              SizedBox(
                                width: 5.w,
                              )
                            ],
                          )),
                ),
                const Spacer(),
                CustomButton(text: 'Next', onTap: () {}),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CustomOnboardCard extends StatelessWidget {
  String img;

  CustomOnboardCard({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight, image: AssetImage(img))),
        ),
      ],
    );
  }
}
