class CourseDetailModel {
  bool? success;
  Data? data;
  String? message;

  CourseDetailModel({this.success, this.data, this.message});

  CourseDetailModel.fromJson(Map<String, dynamic> json) {
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
  Course? course;
  List<Playlist>? playlist;
  List<Reviews>? reviews;
  String? videoBaseUrl;
  String? userProfileUrl;

  Data(
      {this.course,
      this.playlist,
      this.reviews,
      this.videoBaseUrl,
      this.userProfileUrl});

  Data.fromJson(Map<String, dynamic> json) {
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    if (json['playlist'] != null) {
      playlist = <Playlist>[];
      json['playlist'].forEach((v) {
        playlist!.add(Playlist.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    videoBaseUrl = json['video_base_url'];
    userProfileUrl = json['user_profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (course != null) {
      data['course'] = course!.toJson();
    }
    if (playlist != null) {
      data['playlist'] = playlist!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['video_base_url'] = videoBaseUrl;
    data['user_profile_url'] = userProfileUrl;
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
  String? userName;
  String? userImage;
  int? playlistCount;

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
      this.userName,
      this.userImage,
      this.playlistCount});

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
    userName = json['user_name'];
    userImage = json['user_image'];
    playlistCount = json['playlist_count'];
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
    data['user_name'] = userName;
    data['user_image'] = userImage;
    data['playlist_count'] = playlistCount;
    return data;
  }
}

class Playlist {
  int? id;
  String? title;
  String? couseid;
  String? createdAt;
  List<VideoContent>? videoContent;

  Playlist(
      {this.id, this.title, this.couseid, this.createdAt, this.videoContent});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    couseid = json['couseid'];
    createdAt = json['created_at'];
    if (json['video_content'] != null) {
      videoContent = <VideoContent>[];
      json['video_content'].forEach((v) {
        videoContent!.add(VideoContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['couseid'] = couseid;
    data['created_at'] = createdAt;
    if (videoContent != null) {
      data['video_content'] = videoContent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoContent {
  int? id;
  String? title;
  String? shortDescription;
  String? courseId;
  String? courseContentTitleId;
  String? url;
  String? videoType;
  String? videoExtension;
  String? duration;
  String? thumbnail;
  String? createdAt;
  String? modifyAt;
  String? lockVideo;
  String? isImport;

  VideoContent(
      {this.id,
      this.title,
      this.shortDescription,
      this.courseId,
      this.courseContentTitleId,
      this.url,
      this.videoType,
      this.videoExtension,
      this.duration,
      this.thumbnail,
      this.createdAt,
      this.modifyAt,
      this.lockVideo,
      this.isImport});

  VideoContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    courseId = json['course_id'];
    courseContentTitleId = json['course_content_title_id'];
    url = json['url'];
    videoType = json['video_type'];
    videoExtension = json['video_extension'];
    duration = json['duration'];
    thumbnail = json['thumbnail'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
    lockVideo = json['lock_video'];
    isImport = json['is_import'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['course_id'] = courseId;
    data['course_content_title_id'] = courseContentTitleId;
    data['url'] = url;
    data['video_type'] = videoType;
    data['video_extension'] = videoExtension;
    data['duration'] = duration;
    data['thumbnail'] = thumbnail;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    data['lock_video'] = lockVideo;
    data['is_import'] = isImport;
    return data;
  }
}

class Reviews {
  int? id;
  int? courseId;
  int? userId;
  String? review;
  int? stars;
  int? isActive;
  String? createdAt;
  String? modifyAt;
  int? author;

  Reviews(
      {this.id,
      this.courseId,
      this.userId,
      this.review,
      this.stars,
      this.isActive,
      this.createdAt,
      this.modifyAt,
      this.author});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    userId = json['user_id'];
    review = json['review'];
    stars = json['stars'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_id'] = courseId;
    data['user_id'] = userId;
    data['review'] = review;
    data['stars'] = stars;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    data['author'] = author;
    return data;
  }
}
