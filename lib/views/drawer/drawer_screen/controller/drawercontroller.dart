import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lmsapp/models/aboutusmodel.dart';
import 'package:lmsapp/models/certificatemodel.dart';
import 'package:lmsapp/models/privacymodel.dart';
import 'package:lmsapp/utilities/utils.dart';
import 'package:lmsapp/views/drawer/drawer_screen/services/drawerservices.dart';

class DrawerProvider extends ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  bool loadingaboutus = false;
  bool loadingprivacy = false;
  bool loadinghelp = false;
  bool loadingcertificate = false;
  AboutUsModel? _aboutUsModel;
  AboutUsModel? get about => _aboutUsModel;

  CertificateModel? _certificateModel;
  CertificateModel? get certificate => _certificateModel;

  PrivacyPolicyModel? _policyModel;
  PrivacyPolicyModel? get privacy => _policyModel;

  getAboutusdata() async {
    var tokken = await Utils.getToken();
    try {
      loadingaboutus = true;
      notifyListeners();
      await fetchAboutus(tokken).then((aboutus) {
        _aboutUsModel = AboutUsModel.fromJson(aboutus);

        loadingaboutus = false;
        notifyListeners();
      });
    } catch (e) {
      loadingaboutus = false;
      notifyListeners();
      rethrow;
    }
  }

  getCertificate() async {
    var tokken = await Utils.getToken();
    try {
      loadingcertificate = true;
      notifyListeners();
      await fetchCertificate(tokken).then((certificate) {
        _certificateModel = CertificateModel.fromJson(certificate);
        print(certificate);
        loadingcertificate = false;
        notifyListeners();
      });
    } catch (e) {
      loadingcertificate = false;
      notifyListeners();
      rethrow;
    }
  }

  getPrivacyPolicy() async {
    var tokken = await Utils.getToken();

    try {
      loadingprivacy = true;
      notifyListeners();
      await fetchPrivacyPolicy(tokken).then((policy) {
        _policyModel = PrivacyPolicyModel.fromJson(policy);

        loadingprivacy = false;
        notifyListeners();
      });
    } catch (e) {
      loadingprivacy = false;
      notifyListeners();
      rethrow;
    }
  }

  getHelp(context) async {
    var tokken = await Utils.getToken();

    try {
      loadinghelp = true;
      notifyListeners();
      await fetchHelp(
        namecontroller.text,
        emailcontroller.text,
        titlecontroller.text,
        descriptioncontroller.text,
        tokken,
      ).then((help) {
        if (help['success'] == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(help['message'])));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(help['message'])));
        }

        loadinghelp = false;
        notifyListeners();
      });
    } catch (e) {
      loadinghelp = false;
      notifyListeners();
      rethrow;
    }
  }
}
