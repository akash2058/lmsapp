import 'package:flutter/material.dart';
import 'package:lmsapp/models/homemodel.dart';
import 'package:lmsapp/models/usermodel.dart';
import 'package:lmsapp/views/menu_screens/service/mainscreenservices.dart';

class MainMenuScreenController extends ChangeNotifier {
  bool loadinghome = false;
  UserModel? _userModel;
  UserModel? get user => _userModel;
  HomeModel? _homeModel;
  HomeModel? get home => _homeModel;

  getHomedata() async {
    try {
      loadinghome = true;
      notifyListeners();
      await fetchHomedata(user?.data?.token).then((homedata) {
        _homeModel = HomeModel.fromJson(homedata);

        loadinghome = false;
        notifyListeners();
        print('homedata$homedata');
      });
    } catch (e) {
      loadinghome = false;
      notifyListeners();
      throw e;
    }
  }
}
