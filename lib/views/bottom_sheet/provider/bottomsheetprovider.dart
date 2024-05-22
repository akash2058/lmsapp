import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lmsapp/models/gategory_model.dart';
import 'package:lmsapp/models/search_course_model.dart';
import 'package:lmsapp/utilities/utils.dart';
import 'package:lmsapp/views/bottom_sheet/service/bottomsheetservices.dart';

class BottomsheetProvider extends ChangeNotifier {
  TextEditingController searchbycontroller = TextEditingController();
  TextEditingController coursestartrprice = TextEditingController();
  TextEditingController courseratingcontroller = TextEditingController();
  TextEditingController courseendprice = TextEditingController();
  TextEditingController ratingcontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController gategorycontroller = TextEditingController();

  // ignore: unused_field
  double currentSliderValue = 500;
  String selectstar = '';
  void selectstarlist(String text) {
    selectstar = text;
    ratingcontroller.text = text;
    notifyListeners();
  }

  List<String> starratinglist = ['5', '4', '3', '2', '1'];
  int increaseprice = 0;
  GategoryModel? _gategoryModel;
  GategoryModel? get gategory => _gategoryModel;

  SearchCourseModel? _searchCourseModel;
  SearchCourseModel? get searchCourse => _searchCourseModel;

  bool loadinggategory = false;
  bool loadingsearchcourse = false;

  getSearchCourse() async {
    var tokken = await Utils.getToken();

    try {
      loadingsearchcourse = true;
      notifyListeners();
      await fetchSearchCourse(
        tokken,
        coursestartrprice.text,
        courseendprice.text,
        ratingcontroller.text,
      ).then((policy) {
        _searchCourseModel = SearchCourseModel.fromJson(policy);
        loadingsearchcourse = false;
        notifyListeners();
      });
    } catch (e) {
      loadingsearchcourse = false;
      notifyListeners();
      rethrow;
    }
  }

  getGategory() async {
    var tokken = await Utils.getToken();

    try {
      loadinggategory = true;
      notifyListeners();
      await fetchGategory(tokken).then((policy) {
        _gategoryModel = GategoryModel.fromJson(policy);
        loadinggategory = false;
        notifyListeners();
      });
    } catch (e) {
      loadinggategory = false;
      notifyListeners();
      rethrow;
    }
  }
}
