class SearchCourseModel {
  bool? success;
  Data? data;
  String? message;

  SearchCourseModel({this.success, this.data, this.message});

  SearchCourseModel.fromJson(Map<String, dynamic> json) {
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
  List<Course>? course;
  String? imageBaseUrl;

  Data({this.course, this.imageBaseUrl});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['course'] != null) {
      course = <Course>[];
      json['course'].forEach((v) {
        course!.add(Course.fromJson(v));
      });
    }
    imageBaseUrl = json['image_base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (course != null) {
      data['course'] = course!.map((v) => v.toJson()).toList();
    }
    data['image_base_url'] = imageBaseUrl;
    return data;
  }
}

class Course {
  int? id;
  int? userId;
  int? categoryId;
  String? title;
  String? slug;
  String? image;
  int? coursePrice;
  int? salePrice;
  String? courseTime;
  String? status;
  String? description;
  String? shortDescription;
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  String? courseLevel;
  String? createdAt;
  String? updatedAt;
  int? isFeature;
  int? courseBuyDuration;
  String? durationType;
  String? isFree;
  String? couseStatus;
  String? notes;
  String? isPopular;
  String? featured;
  String? appHomeBanner;
  String? categoryName;
  int? totalLesson;

  Course(
      {this.id,
      this.userId,
      this.categoryId,
      this.title,
      this.slug,
      this.image,
      this.coursePrice,
      this.salePrice,
      this.courseTime,
      this.status,
      this.description,
      this.shortDescription,
      this.metaTitle,
      this.metaKeyword,
      this.metaDescription,
      this.courseLevel,
      this.createdAt,
      this.updatedAt,
      this.isFeature,
      this.courseBuyDuration,
      this.durationType,
      this.isFree,
      this.couseStatus,
      this.notes,
      this.isPopular,
      this.featured,
      this.appHomeBanner,
      this.categoryName,
      this.totalLesson});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    title = json['title'];
    slug = json['slug'];
    image = json['image'];
    coursePrice = json['course_price'];
    salePrice = json['sale_price'];
    courseTime = json['course_time'];
    status = json['status'];
    description = json['description'];
    shortDescription = json['short_description'];
    metaTitle = json['meta_title'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    courseLevel = json['course_level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFeature = json['is_feature'];
    courseBuyDuration = json['course_buy_duration'];
    durationType = json['duration_type'];
    isFree = json['is_free'];
    couseStatus = json['couse_status'];
    notes = json['notes'];
    isPopular = json['is_popular'];
    featured = json['featured'];
    appHomeBanner = json['app_home_banner'];
    categoryName = json['category_name'];
    totalLesson = json['total_lesson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['slug'] = slug;
    data['image'] = image;
    data['course_price'] = coursePrice;
    data['sale_price'] = salePrice;
    data['course_time'] = courseTime;
    data['status'] = status;
    data['description'] = description;
    data['short_description'] = shortDescription;
    data['meta_title'] = metaTitle;
    data['meta_keyword'] = metaKeyword;
    data['meta_description'] = metaDescription;
    data['course_level'] = courseLevel;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_feature'] = isFeature;
    data['course_buy_duration'] = courseBuyDuration;
    data['duration_type'] = durationType;
    data['is_free'] = isFree;
    data['couse_status'] = couseStatus;
    data['notes'] = notes;
    data['is_popular'] = isPopular;
    data['featured'] = featured;
    data['app_home_banner'] = appHomeBanner;
    data['category_name'] = categoryName;
    data['total_lesson'] = totalLesson;
    return data;
  }
}
