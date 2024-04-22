import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/views/menucard/main_menu_providers.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, menu, child) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: 73.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        menu.currenttab = 0;
                      });
                    },
                    child: SvgPicture.asset(
                      SvgImages.home,
                      height: 24.h,
                      // ignore: deprecated_member_use
                      color: menu.currenttab == 0
                          ? AppColors.primarybrown
                          : AppColors.primarygrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        menu.currenttab = 1;
                      });
                    },
                    child: SvgPicture.asset(
                      SvgImages.chat,
                      height: 24.h,
                      // ignore: deprecated_member_use
                      color: menu.currenttab == 1
                          ? AppColors.primarybrown
                          : AppColors.primarygrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        menu.currenttab = 2;
                      });
                    },
                    child: SvgPicture.asset(
                      SvgImages.cart,
                      height: 24.h,
                      // ignore: deprecated_member_use
                      color: menu.currenttab == 2
                          ? AppColors.primarybrown
                          : AppColors.primarygrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        menu.currenttab = 3;
                      });
                    },
                    child: SvgPicture.asset(
                      SvgImages.profile,
                      height: 24.h,
                      // ignore: deprecated_member_use
                      color: menu.currenttab == 3
                          ? AppColors.primarybrown
                          : AppColors.primarygrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: menu.screens[menu.currenttab],
        );
      },
    );
  }
}
