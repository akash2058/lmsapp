import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';
import 'package:lmsapp/views/menu_card/main_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<void> manipulateLogin(context) async {
    var token = await getToken();
    if (token != null) {
      Navigator.pushAndRemoveUntil(
          context, CustomPageRoute(child: const MainMenu()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context, CustomPageRoute(child: const LoginPage()), (route) => false);
    }
  }

  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
