import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmsapp/utilities/apiurls.dart';

Future<Map<String, dynamic>> fetchChatroom(token) async {
  final response = await http.get(
    Uri.parse(AppUrls.chatroom),
    headers: {
      // 'Content-Type': 'application/json',
      'Authorization': ' Bearer $token'
    },
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}

Future<Map<String, dynamic>> fetchgetMessage(token, id) async {
  final response = await http.get(
    Uri.parse('${AppUrls.getmessage}$id'),
    headers: {
      // 'Content-Type': 'application/json',
      'Authorization': ' Bearer $token'
    },
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}

Future<Map<String, dynamic>> fetchSendMessage(token, message, chatid) async {
  var body = {
    'message': message,
    'chatid': chatid,
  };
  final response = await http.post(
    Uri.parse(AppUrls.sendmessage),
    body: body,
    headers: {
      // 'Content-Type': 'application/json',
      'Authorization': ' Bearer $token'
    },
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}
