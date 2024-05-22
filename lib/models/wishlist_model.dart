class WishlistModel {
  bool? success;
  Data? data;
  String? message;

  WishlistModel({this.success, this.data, this.message});

  WishlistModel.fromJson(Map<String, dynamic> json) {
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
  List<WishlistItems>? wishlistItems;

  Data({this.imageBaseUrl, this.wishlistItems});

  Data.fromJson(Map<String, dynamic> json) {
    imageBaseUrl = json['image_base_url'];
    if (json['wishlist_items'] != null) {
      wishlistItems = <WishlistItems>[];
      json['wishlist_items'].forEach((v) {
        wishlistItems!.add(WishlistItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_base_url'] = imageBaseUrl;
    if (wishlistItems != null) {
      data['wishlist_items'] =
          wishlistItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishlistItems {
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
  String? courseTime;
  int? categoryId;
  int? totalPlaylists;
  String? categoryTitle;

  WishlistItems(
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
      this.courseSlug,
      this.courseTime,
      this.categoryId,
      this.totalPlaylists,
      this.categoryTitle});

  WishlistItems.fromJson(Map<String, dynamic> json) {
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
    courseTime = json['course_time'];
    categoryId = json['category_id'];
    totalPlaylists = json['total_playlists'];
    categoryTitle = json['category_title'];
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
    data['course_time'] = courseTime;
    data['category_id'] = categoryId;
    data['total_playlists'] = totalPlaylists;
    data['category_title'] = categoryTitle;
    return data;
  }
}