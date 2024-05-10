import 'package:flutter/cupertino.dart';
import 'package:lmsapp/model/aboutusmodel.dart';
import 'package:lmsapp/model/privacymodel.dart';
import 'package:lmsapp/views/drawer/drawerscreen/services/drawerservices.dart';

class DrawerProvider extends ChangeNotifier {
  bool loadingaboutus = false;
  bool loadingprivacy = false;
  AboutUsModel? _aboutUsModel;
  AboutUsModel? get about => _aboutUsModel;

  PrivacyPolicyModel? _policyModel;
  PrivacyPolicyModel? get privacy => _policyModel;

  getAboutusdata(token) async {
    try {
      loadingaboutus = true;
      notifyListeners();
      await fetchAboutus(token).then((aboutus) {
        _aboutUsModel = AboutUsModel.fromJson(aboutus);

        loadingaboutus = false;
        notifyListeners();
        print('about$aboutus');
      });
    } catch (e) {
      loadingaboutus = false;
      notifyListeners();
      throw e;
    }
  }

  getPrivacyPolicy(token) async {
    try {
      loadingprivacy = true;
      notifyListeners();
      await fetchPrivacyPolicy(token).then((policy) {
        _policyModel = PrivacyPolicyModel.fromJson(policy);

        loadingprivacy = false;
        notifyListeners();
        print('policy$policy');
      });
    } catch (e) {
      loadingprivacy = false;
      notifyListeners();
      throw e;
    }
  }
}
