class PaymentModel {
  bool? success;
  Data? data;
  String? message;

  PaymentModel({this.success, this.data, this.message});

  PaymentModel.fromJson(Map<String, dynamic> json) {
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
  String? baseUrl;
  List<Payments>? payments;

  Data({this.baseUrl, this.payments});

  Data.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_url'] = baseUrl;
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payments {
  int? id;
  String? orderId;
  String? courseTitle;
  String? courseId;
  String? courseImage;
  String? salePrice;
  String? createdAt;

  Payments(
      {this.id,
      this.orderId,
      this.courseTitle,
      this.courseId,
      this.courseImage,
      this.salePrice,
      this.createdAt});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    courseTitle = json['course_title'];
    courseId = json['course_id'];
    courseImage = json['course_image'];
    salePrice = json['sale_price'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['course_title'] = courseTitle;
    data['course_id'] = courseId;
    data['course_image'] = courseImage;
    data['sale_price'] = salePrice;
    data['created_at'] = createdAt;
    return data;
  }
}