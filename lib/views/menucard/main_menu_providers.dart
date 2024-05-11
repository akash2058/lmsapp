import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lmsapp/models/homemodel.dart';
import 'package:lmsapp/models/usermodel.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/cart/cartscreen.dart';
import 'package:lmsapp/views/menu_screens/chat/chatscreen.dart';
import 'package:lmsapp/views/menu_screens/home/homescreen.dart';
import 'package:lmsapp/views/menu_screens/profie/profilescreen.dart';
import 'package:lmsapp/views/menu_screens/service/mainscreenservices.dart';

class MenuProviders extends ChangeNotifier {
  int currenttab = 0;
  int currentslide = 0;
  UserModel? _userModel;
  UserModel? get user => _userModel;

  HomeModel? _homeModel;
  HomeModel? get home => _homeModel;
  bool loadinghomedata = false;

  getHomedata(token) async {
    try {
      loadinghomedata = true;
      notifyListeners();
      await fetchHomedata(token).then((home) {
        _homeModel = HomeModel.fromJson(home);

        loadinghomedata = false;
        notifyListeners();
       
      });
    } catch (e) {
      loadinghomedata = false;
      notifyListeners();
      rethrow;
    }
  }

  late PageController pageController;
  void startAutoPageChange() {
    Timer.periodic(const Duration(seconds: 0), (Timer timer) {
      if (currentslide < onboardimgs.length - 1) {
        currentslide++;
      } else {
        currentslide = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentslide,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  List<String> socialimges = [
    AppImages.insta,
    AppImages.facebok,
    AppImages.youtube
  ];

  List<String> onboardimgs = [
    AppImages.onboardone,
    AppImages.onboardtwo,
    AppImages.onboardthree
  ];
  List<String> onboardtitle = [
    'First See Learning',
    'Connect With Everyone',
    'Always Fascinated Learning',
  ];
  List<String> onboardetails = [
    'Forget about a for of paper all knowledge in one learning!',
    'Always keep in touch with your tutor & friend. Let’s get connected!',
    'Anywhere, anytime. The time is at your discretion so study whenever.',
  ];
}
