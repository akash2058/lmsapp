class PrivacyPolicyModel {
  bool? success;
  Data? data;
  String? message;

  PrivacyPolicyModel({this.success, this.data, this.message});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  PrivacyPolicy? privacyPolicy;

  Data({this.privacyPolicy});

  Data.fromJson(Map<String, dynamic> json) {
    privacyPolicy = json['privacy_policy'] != null
        ? PrivacyPolicy.fromJson(json['privacy_policy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (privacyPolicy != null) {
      data['privacy_policy'] = privacyPolicy!.toJson();
    }
    return data;
  }
}

class PrivacyPolicy {
  String? privacyHeading;
  String? privacyDescription;

  PrivacyPolicy({this.privacyHeading, this.privacyDescription});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    privacyHeading = json['privacy_heading'];
    privacyDescription = json['privacy_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['privacy_heading'] = privacyHeading;
    data['privacy_description'] = privacyDescription;
    return data;
  }
}
