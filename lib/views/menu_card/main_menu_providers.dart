import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lmsapp/models/homemodel.dart';
import 'package:lmsapp/models/profile_model.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/cart/cartscreen.dart';
import 'package:lmsapp/views/menu_screens/chat/chatscreen.dart';
import 'package:lmsapp/views/menu_screens/home/homescreen.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_screen.dart';
import 'package:lmsapp/views/menu_screens/service/main_screen_services.dart';

import '../../utilities/utils.dart';

class MenuProviders extends ChangeNotifier {
  int currenttab = 0;
  int currentslide = 0;

  bool loadingprofiledit = false;
  bool loadinggetprofile = false;

  HomeModel? _homeModel;
  HomeModel? get home => _homeModel;

  ProfileModel? _profileModel;
  ProfileModel? get profile => _profileModel;

  bool loadinghomedata = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController nationalitycontroller = TextEditingController();
  TextEditingController provincecontroller = TextEditingController();
  TextEditingController postalcodecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();

  getHomedata(token) async {
    var tokken = await Utils.getToken();
    try {
      loadinghomedata = true;
      notifyListeners();
      await fetchHomedata(tokken).then((home) {
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

  geteditprofile(context) async {
    var tokken = await Utils.getToken();

    try {
      loadingprofiledit = true;
      notifyListeners();
      await fetcheditprofile(
              tokken,
              namecontroller.text,
              phonenumbercontroller.text,
              emailcontroller.text,
              dobcontroller.text,
              postalcodecontroller.text,
              addresscontroller.text,
              citycontroller.text,
              provincecontroller.text,
              countrycontroller.text)
          .then((home) {
        if (home['success'] == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(home['message'])));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(home['message'])));
        }
        loadingprofiledit = false;
        notifyListeners();
      });
    } catch (e) {
      loadingprofiledit = false;
      notifyListeners();
      rethrow;
    }
  }

  getMyProfile() async {
    var tokken = await Utils.getToken();

    try {
      loadinggetprofile = true;
      notifyListeners();
      await fetchprofileget(tokken).then((profile) {
        _profileModel = ProfileModel.fromJson(profile);

        loadinggetprofile = false;
        notifyListeners();
        print(profile);
      });
    } catch (e) {
      loadinggetprofile = false;
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

  DateTime _selectedDate = DateTime.now();
  DateTime get selectdate => _selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      dobcontroller.text = '${picked.year}-${picked.month}-${picked.day}';
      print(dobcontroller.text);

      notifyListeners();
    }
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
