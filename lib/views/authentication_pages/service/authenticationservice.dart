import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lmsapp/utilities/apiurls.dart';

Future<Map<String, dynamic>> fetchLogin(
  email,
  password,
) async {
  var body = {
    'email': email,
    'password': password,
  };
  final response = await http.post(
    Uri.parse(AppUrls.login),
    body: body,
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  print("responseData is $responseData");
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}

Future<Map<String, dynamic>> register(
    name, email, password, confirmpassword) async {
  var body = {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': confirmpassword
  };
  final response = await http.post(
    Uri.parse(AppUrls.register),
    body: body,
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  print("responseData is $responseData");
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}

Future<Map<String, dynamic>> verifybyotp(
  name,
  email,
  password,
) async {
  var body = {
    'name': name,
    'email': email,
    'password': password,
  };
  final response = await http.post(
    Uri.parse(AppUrls.verifyotpandpassword),
    body: body,
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  print("responseData is $responseData");
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}
