import 'package:flutter/cupertino.dart';
import 'package:lmsapp/models/aboutusmodel.dart';
import 'package:lmsapp/models/privacymodel.dart';
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
  
      });
    } catch (e) {
      loadingaboutus = false;
      notifyListeners();
      rethrow;
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
       
      });
    } catch (e) {
      loadingprivacy = false;
      notifyListeners();
      rethrow;
    }
  }
}
