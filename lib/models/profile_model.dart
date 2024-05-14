class ProfileModel {
  bool? success;
  Data? data;
  String? message;

  ProfileModel({this.success, this.data, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? dob;
  String? address;
  String? state;
  String? city;
  String? country;
  String? postcode;
  String? baseurl;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.photo,
      this.dob,
      this.address,
      this.state,
      this.city,
      this.country,
      this.postcode,
      this.baseurl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    dob = json['dob'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    postcode = json['postcode'];
    baseurl = json['baseurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['photo'] = photo;
    data['dob'] = dob;
    data['address'] = address;
    data['state'] = state;
    data['city'] = city;
    data['country'] = country;
    data['postcode'] = postcode;
    data['baseurl'] = baseurl;
    return data;
  }
}
