import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';
import 'package:lmsapp/views/menu_card/main_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Assuming these are your custom routes

class Utils {
  static Future<void> manipulateLogin(BuildContext context) async {
    // Debug: Print the current state before attempting to get the token

    var token = await getToken();

    // Debug: Log the retrieved token value

    if (token == null) {
      // Debug: Token is null or empty, navigating to LoginPage
      // Navigate to LoginPage if the token is null or empty
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        CustomPageRoute(child: const LoginPage()),
        (route) => false,
      );
    } else {
      // Debug: Token is valid, navigating to MainMenu

      // Navigate to MainMenu if the token is not null and not empty
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        CustomPageRoute(child: const MainMenu()),
        (route) => false,
      );
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

  static Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
