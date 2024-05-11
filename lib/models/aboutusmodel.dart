class AboutUsModel {
  bool? success;
  Data? data;
  String? message;

  AboutUsModel({this.success, this.data, this.message});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  AboutUs? aboutUs;

  Data({this.aboutUs});

  Data.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about_us'] != null
        ? new AboutUs.fromJson(json['about_us'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aboutUs != null) {
      data['about_us'] = this.aboutUs!.toJson();
    }
    return data;
  }
}

class AboutUs {
  String? aboutImage;
  String? aboutDescription;

  AboutUs({this.aboutImage, this.aboutDescription});

  AboutUs.fromJson(Map<String, dynamic> json) {
    aboutImage = json['about_image'];
    aboutDescription = json['about_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_image'] = this.aboutImage;
    data['about_description'] = this.aboutDescription;
    return data;
  }
}