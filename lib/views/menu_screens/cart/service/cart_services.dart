import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmsapp/utilities/apiurls.dart';

Future<Map<String, dynamic>> fetchCartdata(token) async {
  final response = await http.get(
    Uri.parse(AppUrls.getcartitems),
    headers: {'Authorization': ' Bearer $token'},
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



Future<Map<String, dynamic>> fetchAddCart(token, id) async {
  var body = {'course_id': id};
  final response = await http.post(
    Uri.parse(AppUrls.addcart),
    body: body,
    headers: {'Authorization': ' Bearer $token'},
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  print('print$responseData');
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}

Future<Map<String, dynamic>> fetchRemoveCart(token, id) async {
  var body = {'cart_id': id};
  final response = await http.post(
    Uri.parse(AppUrls.removecart),
    body: body,
    headers: {'Authorization': ' Bearer $token'},
  );
  // if (kDebugMode) {
  //   print("status code: ${response.statusCode}");
  // }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  print('remove$responseData');
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}
Future<Map<String, dynamic>> fetchWishlistdata(token) async {
  final response = await http.get(
    Uri.parse(AppUrls.getwishlists),
    headers: {'Authorization': ' Bearer $token'},
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
