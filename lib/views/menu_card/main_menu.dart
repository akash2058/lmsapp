import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/cart/cart_provider/cart_provider.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    var state = Provider.of<MenuProviders>(context, listen: false);
    var auth = Provider.of<AuthenticationProvider>(context, listen: false);
    state.currenttab = 0;
    auth.loadLoginData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, menu, child) {
        return Scaffold(
            bottomNavigationBar: BottomAppBar(
              height: 80.h,
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
                        height: 30.h,
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
                        height: 30.h,
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
                        SvgImages.heart,
                        height: 30.h,
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
                        height: 30.h,
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
            body: IndexedStack(
              index: menu.currenttab,
              children: menu.screens,
            ));
      },
    );
  }
}
