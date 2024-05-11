class HomeModel {
  bool? success;
  Data? data;
  String? message;

  HomeModel({this.success, this.data, this.message});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<HomeBanner>? homeBanner;
  List<RecentlyAddedCourse>? recentlyAddedCourse;
  List<FeaturedCourse>? featuredCourse;
  List<PopularCourse>? popularCourse;
  List<Category>? category;
  List<Reviews>? reviews;
  SocilaLink? socilaLink;
  String? baseUrl;

  Data(
      {this.homeBanner,
      this.recentlyAddedCourse,
      this.featuredCourse,
      this.popularCourse,
      this.category,
      this.reviews,
      this.socilaLink,
      this.baseUrl});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['home_banner'] != null) {
      homeBanner = <HomeBanner>[];
      json['home_banner'].forEach((v) {
        homeBanner!.add(new HomeBanner.fromJson(v));
      });
    }
    if (json['recently_added_course'] != null) {
      recentlyAddedCourse = <RecentlyAddedCourse>[];
      json['recently_added_course'].forEach((v) {
        recentlyAddedCourse!.add(new RecentlyAddedCourse.fromJson(v));
      });
    }
    if (json['featured_course'] != null) {
      featuredCourse = <FeaturedCourse>[];
      json['featured_course'].forEach((v) {
        featuredCourse!.add(new FeaturedCourse.fromJson(v));
      });
    }
    if (json['popular_course'] != null) {
      popularCourse = <PopularCourse>[];
      json['popular_course'].forEach((v) {
        popularCourse!.add(new PopularCourse.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    socilaLink = json['socila_link'] != null
        ? new SocilaLink.fromJson(json['socila_link'])
        : null;
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeBanner != null) {
      data['home_banner'] = this.homeBanner!.map((v) => v.toJson()).toList();
    }
    if (this.recentlyAddedCourse != null) {
      data['recently_added_course'] =
          this.recentlyAddedCourse!.map((v) => v.toJson()).toList();
    }
    if (this.featuredCourse != null) {
      data['featured_course'] =
          this.featuredCourse!.map((v) => v.toJson()).toList();
    }
    if (this.popularCourse != null) {
      data['popular_course'] =
          this.popularCourse!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.socilaLink != null) {
      data['socila_link'] = this.socilaLink!.toJson();
    }
    data['base_url'] = this.baseUrl;
    return data;
  }
}

class HomeBanner {
  int? playlistsCount;
  String? category;
  int? id;
  String? title;
  String? image;
  int? coursePrice;
  int? salePrice;
  String? courseTime;

  HomeBanner(
      {this.playlistsCount,
      this.category,
      this.id,
      this.title,
      this.image,
      this.coursePrice,
      this.salePrice,
      this.courseTime});

  HomeBanner.fromJson(Map<String, dynamic> json) {
    playlistsCount = json['playlists_count'];
    category = json['category'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
    coursePrice = json['course_price'];
    salePrice = json['sale_price'];
    courseTime = json['course_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playlists_count'] = this.playlistsCount;
    data['category'] = this.category;
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['course_price'] = this.coursePrice;
    data['sale_price'] = this.salePrice;
    data['course_time'] = this.courseTime;
    return data;
  }
}

class Category {
  int? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class Reviews {
  int? id;
  String? review;
  int? stars;
  String? createdAt;

  Reviews({this.id, this.review, this.stars, this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    review = json['review'];
    stars = json['stars'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['review'] = this.review;
    data['stars'] = this.stars;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class SocilaLink {
  String? facebook;
  String? youtube;
  String? instagram;

  SocilaLink({this.facebook, this.youtube, this.instagram});

  SocilaLink.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    youtube = json['youtube'];
    instagram = json['instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['youtube'] = this.youtube;
    data['instagram'] = this.instagram;
    return data;
  }
}

class RecentlyAddedCourse {
  int? playlistsCount;
  String? category;
  int? id;
  String? title;
  String? image;
  int? coursePrice;
  int? salePrice;
  String? courseTime;

  RecentlyAddedCourse(
      {this.playlistsCount,
      this.category,
      this.id,
      this.title,
      this.image,
      this.coursePrice,
      this.salePrice,
      this.courseTime});

  RecentlyAddedCourse.fromJson(Map<String, dynamic> json) {
    playlistsCount = json['playlists_count'];
    category = json['category'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
    coursePrice = json['course_price'];
    salePrice = json['sale_price'];
    courseTime = json['course_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playlists_count'] = this.playlistsCount;
    data['category'] = this.category;
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['course_price'] = this.coursePrice;
    data['sale_price'] = this.salePrice;
    data['course_time'] = this.courseTime;
    return data;
  }
}

class FeaturedCourse {
  int? playlistsCount;
  String? category;
  int? id;
  String? title;
  String? image;
  int? coursePrice;
  int? salePrice;
  String? courseTime;

  FeaturedCourse(
      {this.playlistsCount,
      this.category,
      this.id,
      this.title,
      this.image,
      this.coursePrice,
      this.salePrice,
      this.courseTime});

  FeaturedCourse.fromJson(Map<String, dynamic> json) {
    playlistsCount = json['playlists_count'];
    category = json['category'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
    coursePrice = json['course_price'];
    salePrice = json['sale_price'];
    courseTime = json['course_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playlists_count'] = this.playlistsCount;
    data['category'] = this.category;
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['course_price'] = this.coursePrice;
    data['sale_price'] = this.salePrice;
    data['course_time'] = this.courseTime;
    return data;
  }
}

class PopularCourse {
  int? playlistsCount;
  String? category;
  int? id;
  String? title;
  String? image;
  int? coursePrice;
  int? salePrice;
  String? courseTime;

  PopularCourse(
      {this.playlistsCount,
      this.category,
      this.id,
      this.title,
      this.image,
      this.coursePrice,
      this.salePrice,
      this.courseTime});

  PopularCourse.fromJson(Map<String, dynamic> json) {
    playlistsCount = json['playlists_count'];
    category = json['category'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
    coursePrice = json['course_price'];
    salePrice = json['sale_price'];
    courseTime = json['course_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playlists_count'] = this.playlistsCount;
    data['category'] = this.category;
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['course_price'] = this.coursePrice;
    data['sale_price'] = this.salePrice;
    data['course_time'] = this.courseTime;
    return data;
  }
}
