import 'dart:io';

class MessageModel {
  bool? success;
  Data? data;
  String? message;

  MessageModel({this.success, this.data, this.message});

  MessageModel.fromJson(Map<String, dynamic> json) {
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
  String? userProfileBaseUrl;
  List<Chats>? chats;

  Data({this.userProfileBaseUrl, this.chats});

  Data.fromJson(Map<String, dynamic> json) {
    userProfileBaseUrl = json['user_profile_base_url'];
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_profile_base_url'] = userProfileBaseUrl;
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  int? id;
  int? chatId;
  int? senderId;
  int? receiverId;
  String? message;
  File? file;
  String? dateTime;
  String? createdAt;
  String? modifyAt;
  int? isRead;
  String? senderName;
  String? senderPhoto;
  String? receiverName;
  String? receiverPhoto;
  String? otherUserPhoto;
  String? otherUserName;

  Chats(
      {this.id,
      this.chatId,
      this.senderId,
      this.receiverId,
      this.message,
      this.file,
      this.dateTime,
      this.createdAt,
      this.modifyAt,
      this.isRead,
      this.senderName,
      this.senderPhoto,
      this.receiverName,
      this.receiverPhoto,
      this.otherUserPhoto,
      this.otherUserName});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    message = json['message'];
    file = json['file'];
    dateTime = json['date_time'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
    isRead = json['is_read'];
    senderName = json['sender_name'];
    senderPhoto = json['sender_photo'];
    receiverName = json['receiver_name'];
    receiverPhoto = json['receiver_photo'];
    otherUserPhoto = json['other_user_photo'];
    otherUserName = json['other_user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chat_id'] = chatId;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['message'] = message;
    data['file'] = file;
    data['date_time'] = dateTime;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    data['is_read'] = isRead;
    data['sender_name'] = senderName;
    data['sender_photo'] = senderPhoto;
    data['receiver_name'] = receiverName;
    data['receiver_photo'] = receiverPhoto;
    data['other_user_photo'] = otherUserPhoto;
    data['other_user_name'] = otherUserName;
    return data;
  }
}
