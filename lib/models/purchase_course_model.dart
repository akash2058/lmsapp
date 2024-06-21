class MyCourseModel {
  bool? success;
  List<Data>? data;
  String? message;

  MyCourseModel({this.success, this.data, this.message});

  MyCourseModel.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? courseTitle;
  String? courseId;
  String? courseImage;
  int? lesson;
  String? duration;
  String? baseUrl;

  Data(
      {this.id,
      this.orderId,
      this.courseTitle,
      this.courseId,
      this.courseImage,
      this.lesson,
      this.duration,
      this.baseUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    courseTitle = json['course_title'];
    courseId = json['course_id'];
    courseImage = json['course_image'];
    lesson = json['lesson'];
    duration = json['duration'];
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['course_title'] = courseTitle;
    data['course_id'] = courseId;
    data['course_image'] = courseImage;
    data['lesson'] = lesson;
    data['duration'] = duration;
    data['base_url'] = baseUrl;
    return data;
  }
}
