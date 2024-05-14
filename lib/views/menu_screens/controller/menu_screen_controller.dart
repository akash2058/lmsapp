import 'package:flutter/material.dart';
import 'package:lmsapp/models/homemodel.dart';
import 'package:lmsapp/models/usermodel.dart';
import 'package:lmsapp/views/menu_screens/service/main_screen_services.dart';

class MainMenuScreenController extends ChangeNotifier {
  bool loadinghome = false;
  UserModel? _userModel;
  UserModel? get user => _userModel;
  HomeModel? _homeModel;
  HomeModel? get home => _homeModel;
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      notifyListeners();
    }
  }
}
