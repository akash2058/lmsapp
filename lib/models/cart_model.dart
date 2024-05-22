class CartModel {
  bool? success;
  Data? data;
  String? message;

  CartModel({this.success, this.data, this.message});

  CartModel.fromJson(Map<String, dynamic> json) {
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
  String? imageBaseUrl;
  List<CartItems>? cartItems;
  int? totalPrice;
  int? afterDiscountPrice;

  Data(
      {this.imageBaseUrl,
      this.cartItems,
      this.totalPrice,
      this.afterDiscountPrice});

  Data.fromJson(Map<String, dynamic> json) {
    imageBaseUrl = json['image_base_url'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    afterDiscountPrice = json['after_discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_base_url'] = imageBaseUrl;
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = totalPrice;
    data['after_discount_price'] = afterDiscountPrice;
    return data;
  }
}

class CartItems {
  int? id;
  int? userId;
  int? courseId;
  String? courseTitle;
  String? courseImage;
  String? coursePrice;
  String? salePrice;
  int? ownerId;
  String? ownerName;
  String? createdAt;
  String? modifyAt;
  String? courseSlug;

  CartItems(
      {this.id,
      this.userId,
      this.courseId,
      this.courseTitle,
      this.courseImage,
      this.coursePrice,
      this.salePrice,
      this.ownerId,
      this.ownerName,
      this.createdAt,
      this.modifyAt,
      this.courseSlug});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    courseTitle = json['course_title'];
    courseImage = json['course_image'];
    coursePrice = json['course_price'];
    salePrice = json['sale_price'];
    ownerId = json['owner_id'];
    ownerName = json['owner_name'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
    courseSlug = json['course_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['course_id'] = courseId;
    data['course_title'] = courseTitle;
    data['course_image'] = courseImage;
    data['course_price'] = coursePrice;
    data['sale_price'] = salePrice;
    data['owner_id'] = ownerId;
    data['owner_name'] = ownerName;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    data['course_slug'] = courseSlug;
    return data;
  }
}
