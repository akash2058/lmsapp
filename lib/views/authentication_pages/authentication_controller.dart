// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/models/registermodel.dart';
import 'package:lmsapp/models/usermodel.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';
import 'package:lmsapp/views/authentication_pages/otp_screen/otpscreen.dart';
import 'package:lmsapp/views/authentication_pages/service/authentication_service.dart';

import 'package:lmsapp/views/menu_card/main_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/utils.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool hidepasswordlogin = true;
  bool hideconfirmpassword = true;
  bool hideenterpassword = true;
  bool hidecreatepasswords = true;
  bool loadingchangepassword = false;
  bool loadingeditprofile = false;
  bool loadingprofile = false;
  bool loadinguser = false;
  bool loadingforgotpassword = false;

  bool loadingregister = false;
  bool loadingverification = false;
  bool termsandcondition = false;
  bool loadinglogout = false;
  bool isloggin = false;
  // ignore: prefer_final_fields

  UserModel? _userModel;
  UserModel? get user => _userModel;
  RegisterModel? _registerModel;
  RegisterModel? get registers => _registerModel;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();

  TextEditingController otpcontroller = TextEditingController();
  final loginform = GlobalKey<FormState>();

  hidepassword() {
    hideenterpassword = !hideenterpassword;
    notifyListeners();
  }

  hidecreatepassword() {
    hidecreatepasswords = !hidecreatepasswords;
    notifyListeners();
  }

  hideconfirmpasswords() {
    hideconfirmpassword = !hideconfirmpassword;
    notifyListeners();
  }

  bool _isRememberMe = false;
  bool get isRememberMe => _isRememberMe;
  void toggleRememberMe(bool value) {
    _isRememberMe = value;
    notifyListeners();
  }

  Future<void> saveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_isRememberMe == true) {
      prefs.setBool('isRememberMe', _isRememberMe);
    } else {
      prefs.remove('isRememberMe');
      prefs.remove('email');
      prefs.remove('password');
    }
  }

  Future<void> loadLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isRememberMe = prefs.getBool('isRememberMe') ?? false;
    emailcontroller.text = prefs.getString('email') ?? '';
    passwordcontroller.text = prefs.getString('password') ?? '';
    notifyListeners();
  }

  getLogin(context) async {
    try {
      loadinguser = true;
      notifyListeners();
      await fetchLogin(
        emailcontroller.text,
        passwordcontroller.text,
      ).then((userMap) {
        _userModel = UserModel.fromJson(userMap);
        if (userMap['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primarygreen,
              content: Text(userMap['message'])));

          Utils.saveToken(user!.data!.token.toString());

          Navigator.pushAndRemoveUntil(context,
              CustomPageRoute(child: const MainMenu()), (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(userMap['message'])));
        }
        notifyListeners();
        loadinguser = false;
      });
    } catch (e) {
      notifyListeners();
      loadinguser = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }

  fetchRegister(context) async {
    try {
      loadingregister = true;
      notifyListeners();
      await register(namecontroller.text, emailcontroller.text,
              passwordcontroller.text, confirmpasswordcontroller.text)
          .then((userMap) {
        _registerModel = RegisterModel.fromJson(userMap);
        if (userMap['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primarygreen,
              content: Text(userMap['message'])));

          Navigator.push(context, CustomPageRoute(child: const OtpScreen()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(userMap['message'])));
        }
        notifyListeners();
        loadingregister = false;
      });
    } catch (e) {
      notifyListeners();
      loadingregister = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }

  fetchotp(context) async {
    try {
      loadingverification = true;
      notifyListeners();

      // Call the API to verify OTP
      var userMap = await verifybyotp(
        namecontroller.text,
        emailcontroller.text,
        passwordcontroller.text,
      );

      if (userMap['success'] == true) {
        _userModel = UserModel.fromJson(userMap);
        Navigator.pushAndRemoveUntil(context,
            CustomPageRoute(child: const MainMenu()), (route) => false);
        // OTP is not valid, show message
      } else {
        // API call was not successful, show message from API response
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryred,
            content: Text(userMap['message']),
          ),
        );
      }
      notifyListeners();
      loadingverification = false;
    } catch (e) {
      // Handle errors
      notifyListeners();
      loadingverification = false;
      throw {'error': e}; // Throw a map containing the error message
    }
  }

  getforgotPassword(context) async {
    try {
      loadingforgotpassword = true;
      notifyListeners();
      await fetchforgotPassword(emailcontroller.text).then((forgot) {
        if (forgot['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primarygreen,
              content: Text(forgot['message'])));
        } else if (forgot['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(forgot['message'])));
        }
        notifyListeners();
        loadingforgotpassword = false;
      });
    } catch (e) {
      notifyListeners();
      loadingforgotpassword = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }

  logout(token, context) async {
    try {
      loadinglogout = true;
      notifyListeners();
      await fetchlogout(token).then((forgot) {
        if (forgot['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primarygreen,
              content: Text(forgot['message'])));
          Navigator.pushAndRemoveUntil(context,
              CustomPageRoute(child: const LoginPage()), (route) => false);
        } else if (forgot['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(forgot['message'])));
        }
        notifyListeners();
        loadinglogout = false;
      });
    } catch (e) {
      notifyListeners();
      loadinglogout = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }

  getchangepassword(context, ) async {
        var tokken = await Utils.getToken();

    try {
      loadingchangepassword = true;
      notifyListeners();
      await fetchChangepassword(
        tokken,
        newpasswordcontroller.text,
        currentpasswordcontroller.text,
        confirmpasswordcontroller.text,
      ).then((forgot) {
        if (forgot['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primarygreen,
              content: Text(forgot['message'])));
        } else if (forgot['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(forgot['message'])));
        }
        print(forgot);
        notifyListeners();
        loadingchangepassword = false;
      });
    } catch (e) {
      notifyListeners();
      loadingchangepassword = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }
}
