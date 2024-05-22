import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmsapp/utilities/apiurls.dart';

Future<Map<String, dynamic>> fetchGategory(token) async {
  final response = await http.get(
    Uri.parse(AppUrls.gategory),
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

Future<Map<String, dynamic>> fetchSearchCourse(
  token,
  startPrice,
  endPrice,
  star,
) async {
  final response = await http.get(
    Uri.parse(
        '${AppUrls.searchcourse}?start_price=$startPrice&end_price=$endPrice&star=$star'),
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
