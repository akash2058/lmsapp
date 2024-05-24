class ChatRoomModel {
  bool? success;
  Data? data;
  String? message;

  ChatRoomModel({this.success, this.data, this.message});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
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
  List<ChatRoom>? chatRoom;
  String? userProfileBaseUrl;

  Data({this.chatRoom, this.userProfileBaseUrl});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['chat_room'] != null) {
      chatRoom = <ChatRoom>[];
      json['chat_room'].forEach((v) {
        chatRoom!.add(ChatRoom.fromJson(v));
      });
    }
    userProfileBaseUrl = json['user_profile_base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chatRoom != null) {
      data['chat_room'] = chatRoom!.map((v) => v.toJson()).toList();
    }
    data['user_profile_base_url'] = userProfileBaseUrl;
    return data;
  }
}

class ChatRoom {
  int? id;
  int? chatId;
  int? user1;
  int? user2;
  String? createdAt;
  String? modifyAt;
  int? isDeleted;
  String? user1Name;
  String? user2Name;
  String? authUserPosition;
  String? otherUserName;
  String? otherUserPhoto;
  String? lastMessage;
  String? lastMessageTime;

  ChatRoom(
      {this.id,
      this.chatId,
      this.user1,
      this.user2,
      this.createdAt,
      this.modifyAt,
      this.isDeleted,
      this.user1Name,
      this.user2Name,
      this.authUserPosition,
      this.otherUserName,
      this.otherUserPhoto,
      this.lastMessage,
      this.lastMessageTime});

  ChatRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    user1 = json['user1'];
    user2 = json['user2'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
    isDeleted = json['is_deleted'];
    user1Name = json['user1_name'];
    user2Name = json['user2_name'];
    authUserPosition = json['auth_user_position'];
    otherUserName = json['other_user_name'];
    otherUserPhoto = json['other_user_photo'];
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chat_id'] = chatId;
    data['user1'] = user1;
    data['user2'] = user2;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    data['is_deleted'] = isDeleted;
    data['user1_name'] = user1Name;
    data['user2_name'] = user2Name;
    data['auth_user_position'] = authUserPosition;
    data['other_user_name'] = otherUserName;
    data['other_user_photo'] = otherUserPhoto;
    data['last_message'] = lastMessage;
    data['last_message_time'] = lastMessageTime;
    return data;
  }
}
