import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/model/usermodel.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/views/authentication_pages/forgotpassword_pages/components/registerdialogbox.dart';
import 'package:lmsapp/views/authentication_pages/register_page/register_page.dart';
import 'package:lmsapp/views/authentication_pages/service/authenticationservice.dart';
import 'package:lmsapp/views/menu_screens/chat/chatscreen.dart';
import 'package:lmsapp/views/menucard/main_menu.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool hidepasswordlogin = false;
  bool hideconfirmpassword = false;
  bool hideenterpassword = false;
  bool loadinguser = false;

  bool loadingregister = false;
  bool loadingverification = false;
  bool termsandcondition = true;

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
        if (userMap['success'] == true) {
          if (termsandcondition == true) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppColors.primarygreen,
                content: Text(userMap['message'])));
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RegisterSuccesfuldialog(
                    name: namecontroller.text,
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                  );
                });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(userMap['message'])));
          }
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

  fetchotp(context) async {
    try {
      loadingverification = true;
      notifyListeners();
      await verifybyotp(
        emailcontroller.text,
        passwordcontroller.text,
        namecontroller.text,
      ).then((userMap) {
        _userModel = UserModel.fromJson(userMap);
        if (userMap['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primarygreen,
              content: Text(userMap['message'])));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(' Agree With terms and condition')));
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
}
