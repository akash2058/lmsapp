class CertificateModel {
  bool? success;
  List<Data>? data;
  String? message;

  CertificateModel({this.success, this.data, this.message});

  CertificateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? cerificateTitle;
  String? isPass;
  String? link;

  Data({this.id, this.cerificateTitle, this.isPass, this.link});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cerificateTitle = json['cerificate_title'];
    isPass = json['is_pass'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cerificate_title'] = cerificateTitle;
    data['is_pass'] = isPass;
    data['link'] = link;
    return data;
  }
}
