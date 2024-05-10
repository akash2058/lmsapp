import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/model/usermodel.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/authentication_pages/forgotpassword_pages/components/registerdialogbox.dart';
import 'package:lmsapp/views/authentication_pages/login_page/login_page.dart';
import 'package:lmsapp/views/authentication_pages/service/authenticationservice.dart';

import 'package:lmsapp/views/menucard/main_menu.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool hidepasswordlogin = false;
  bool hideconfirmpassword = false;
  bool hideenterpassword = true;
  bool loadinguser = false;
  bool loadingforgotpassword = false;

  bool loadingregister = false;
  bool loadingverification = false;
  bool termsandcondition = false;
  bool loadinglogout = false;

  UserModel? _userModel;
  UserModel? get user => _userModel;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final loginform = GlobalKey<FormState>();

  hidepassword() {
    hideenterpassword = !hideenterpassword;
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
          Navigator.push(context, CustomPageRoute(child: const MainMenu()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(userMap['message'])));
        }
        print('userrr$userMap');
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
        if (userMap['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(userMap['message'])));
        }
        print('register$userMap');
        notifyListeners();
        loadingregister = false;
      });
    } catch (e) {
      notifyListeners();
      loadingregister = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }

  fetchotp(context, name, email, password) async {
    try {
      loadingverification = true;
      notifyListeners();
      await verifybyotp(name, email, password).then((userMap) {
        _userModel = UserModel.fromJson(userMap);
        if (userMap['success'] == true) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RegisterSuccesfuldialog(
                  name: namecontroller.text,
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
                );
              });
        } else if (userMap['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(userMap['message'])));
        }
        print('verify$userMap');
        notifyListeners();
        loadingverification = false;
      });
    } catch (e) {
      notifyListeners();
      loadingverification = false;
      throw {"error": e}; // Throw a map containing the error message
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
        print('forgot$forgot');
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
          Navigator.pushAndRemoveUntil(
              context, CustomPageRoute(child: LoginPage()), (route) => false);
        } else if (forgot['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(forgot['message'])));
        }
        print('logout$forgot');
        notifyListeners();
        loadinglogout = false;
      });
    } catch (e) {
      notifyListeners();
      loadinglogout = false;
      throw {"error": e}; // Throw a map containing the error message
    }
  }
}
