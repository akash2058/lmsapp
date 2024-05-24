import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsapp/models/chatroomodel.dart';
import 'package:lmsapp/models/messagemodel.dart';
import 'package:lmsapp/utilities/utils.dart';
import 'package:lmsapp/views/menu_screens/chat/services/chat_services.dart';

class ChatProvider extends ChangeNotifier {
  bool loadingchatroom = false;
  bool loadingmessage = false;

  ChatRoomModel? chatRoomModel;
  ChatRoomModel? get chat => chatRoomModel;

  MessageModel? messageModel;
  MessageModel? get message => messageModel;

  getChatRoom(context) async {
    var tokken = await Utils.getToken();
    try {
      loadingchatroom = true;
      notifyListeners();
      await fetchChatroom(tokken).then((policy) {
        chatRoomModel = ChatRoomModel.fromJson(policy);
        loadingchatroom = false;
        notifyListeners();
        print('chats${policy}');
      });
    } catch (e) {
      loadingchatroom = false;
      notifyListeners();
      rethrow;
    }
  }

  getMessage(context, id) async {
    var tokken = await Utils.getToken();
    try {
      loadingmessage = true;
      notifyListeners();
      await fetchgetMessage(tokken, id).then((policy) {
        messageModel = MessageModel.fromJson(policy);
        loadingmessage = false;
        notifyListeners();
        print('message$policy');
      });
    } catch (e) {
      loadingmessage = false;
      notifyListeners();
      rethrow;
    }
  }
}
