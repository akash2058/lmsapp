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

//savingusercredintial
  String token = '';
  String name = '';
  String email = '';

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
  Future<void> toggleRememberMe(bool value) async {
    _isRememberMe = value;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRememberMe', value);
  }

  Future<void> loadLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isRememberMe = prefs.getBool('isRememberMe') ?? false;
    emailcontroller.text = prefs.getString('email') ?? '';

    email = prefs.getString('email') ?? '';
    name = prefs.getString('name') ?? '';
    token = prefs.getString('token') ?? '';
    notifyListeners();
  }

  Future<void> getLogin(BuildContext context) async {
    try {
      loadinguser = true;
      notifyListeners();

      final userMap = await fetchLogin(
        emailcontroller.text,
        passwordcontroller.text,
      );

      _userModel = UserModel.fromJson(userMap);

      if (userMap['success'] == true) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.primarygreen,
          content: Text(userMap['message']),
        ));
        debugPrint(user!.data!.token.toString());
        Utils.saveToken(user?.data?.token ?? '');
        // Save token, name, and email to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', user?.data?.name ?? '');
        await prefs.setString('email', user?.data?.email ?? '');

        Navigator.pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          CustomPageRoute(child: const MainMenu()),
          (route) => false,
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.primaryred,
          content: Text(userMap['message']),
        ));
      }

      loadinguser = false;
      notifyListeners();
    } catch (e) {
      loadinguser = false;
      notifyListeners();
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
        print(userMap);
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
        Utils.saveToken(user?.data?.token ?? '');
        Navigator.pushAndRemoveUntil(context,
            CustomPageRoute(child: const MainMenu()), (route) => false);
        print(userMap);
      } else {
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
          Navigator.push(context, CustomPageRoute(child: const LoginPage()));
        } else if (forgot['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(forgot['message'])));
        }
        notifyListeners();
        loadingforgotpassword = false;
        print(forgot);
      });
    } catch (e) {
      notifyListeners();
      loadingforgotpassword = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }

  logout(context) async {
    var tokken = await Utils.getToken();

    try {
      loadinglogout = true;
      notifyListeners();
      await Utils.deleteToken();
      await fetchlogout(tokken).then((forgot) {
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

  getchangepassword(
    context,
  ) async {
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
          Navigator.pushAndRemoveUntil(context,
              CustomPageRoute(child: const MainMenu()), (route) => false);
        } else if (forgot['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(forgot['message'])));
        }
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
