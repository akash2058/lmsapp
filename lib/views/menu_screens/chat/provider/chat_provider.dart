import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/models/chatroomodel.dart';
import 'package:lmsapp/models/messagemodel.dart';
import 'package:lmsapp/utilities/utils.dart';
import 'package:lmsapp/views/menu_screens/chat/services/chat_services.dart';
import 'dart:async';

class ChatProvider extends ChangeNotifier {
  bool loadingchatroom = false;
  bool loadingmessage = false;
  bool loadingsendingmessage = false;

  ChatRoomModel? chatRoomModel;
  ChatRoomModel? get chat => chatRoomModel;

  MessageModel? messageModel;
  MessageModel? get message => messageModel;
  TextEditingController messagecontroller = TextEditingController();

  final StreamController<MessageModel> _messageStreamController = StreamController.broadcast();

  Stream<MessageModel> get messageStream => _messageStreamController.stream;

  @override
  void dispose() {
    _messageStreamController.close();
    super.dispose();
  }

  getChatRoom(context) async {
    var tokken = await Utils.getToken();
    try {
      loadingchatroom = true;
      notifyListeners();
      await fetchChatroom(tokken).then((policy) {
        chatRoomModel = ChatRoomModel.fromJson(policy);
        loadingchatroom = false;
        notifyListeners();
      });
    } catch (e) {
      loadingchatroom = false;
      notifyListeners();
      rethrow;
    }
  }

  getMessage(context, id, String userId) async {
    var tokken = await Utils.getToken();
    try {
      loadingmessage = true;
      notifyListeners();
      await fetchgetMessage(tokken, id).then((policy) {
        messageModel = MessageModel.fromJson(policy);
        _messageStreamController.add(messageModel!);
        loadingmessage = false;
        notifyListeners();
      });
    } catch (e) {
      loadingmessage = false;
      notifyListeners();
      rethrow;
    }
  }

  sendMessage(context, id, String uiserId) async {
    var tokken = await Utils.getToken();
    try {
      loadingsendingmessage = true;
      notifyListeners();
      await fetchSendMessage(tokken, messagecontroller.text, id).then((policy) {
        var newMessage = Chats(
          message: messagecontroller.text,
          senderId: int.parse(uiserId),
        );
        message!.data!.chats!.add(newMessage);
        _messageStreamController.add(messageModel!);
        messagecontroller.clear();
        loadingsendingmessage = false;
        notifyListeners();
      });
    } catch (e) {
      loadingsendingmessage = false;
      notifyListeners();
      rethrow;
    }
  }
}
