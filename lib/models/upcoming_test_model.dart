class UpComingTestModel {
  bool? success;
  Data? data;
  String? message;

  UpComingTestModel({this.success, this.data, this.message});

  UpComingTestModel.fromJson(Map<String, dynamic> json) {
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
  List<AllTest>? allTest;
  String? imageBaseUrl;

  Data({this.allTest, this.imageBaseUrl});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['all_test'] != null) {
      allTest = <AllTest>[];
      json['all_test'].forEach((v) {
        allTest!.add(AllTest.fromJson(v));
      });
    }
    imageBaseUrl = json['image_base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allTest != null) {
      data['all_test'] = allTest!.map((v) => v.toJson()).toList();
    }
    data['image_base_url'] = imageBaseUrl;
    return data;
  }
}

class AllTest {
  int? id;
  int? userid;
  int? courseId;
  String? title;
  String? passPercent;
  String? numOfAttemp;
  String? questions;
  String? publish;
  String? createdAt;
  String? modifyAt;
  String? courseImage;

  AllTest(
      {this.id,
      this.userid,
      this.courseId,
      this.title,
      this.passPercent,
      this.numOfAttemp,
      this.questions,
      this.publish,
      this.createdAt,
      this.modifyAt,
      this.courseImage});

  AllTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    courseId = json['course_id'];
    title = json['title'];
    passPercent = json['pass_percent'];
    numOfAttemp = json['num_of_attemp'];
    questions = json['questions'];
    publish = json['publish'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
    courseImage = json['course_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['course_id'] = courseId;
    data['title'] = title;
    data['pass_percent'] = passPercent;
    data['num_of_attemp'] = numOfAttemp;
    data['questions'] = questions;
    data['publish'] = publish;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    data['course_image'] = courseImage;
    return data;
  }
}
