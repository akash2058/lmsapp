class NotificationModels {
  bool? success;
  List<Data>? data;
  String? message;

  NotificationModels({this.success, this.data, this.message});

  NotificationModels.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? section;
  String? createdAt;
  String? isRead;
  int? userid;

  Data(
      {this.id,
      this.title,
      this.section,
      this.createdAt,
      this.isRead,
      this.userid});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    section = json['section'];
    createdAt = json['created_at'];
    isRead = json['is_read'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['section'] = section;
    data['created_at'] = createdAt;
    data['is_read'] = isRead;
    data['userid'] = userid;
    return data;
  }
}
