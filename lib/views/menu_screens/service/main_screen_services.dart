import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lmsapp/utilities/apiurls.dart';

Future<Map<String, dynamic>> fetchHomedata(token) async {
  try {
    final response = await http.get(
      Uri.parse(AppUrls.home),
      headers: {
        // 'Content-Type': 'application/json',
        'Authorization': ' Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Failed to get data');
    }
  } catch (e) {
    throw Exception('Failed to get data');
  }
}

Future<Map<String, dynamic>> fetchprofileget(token) async {
  final response = await http.get(
    Uri.parse(AppUrls.geteditprofile),
    headers: {
      // 'Content-Type': 'application/json',
      'Authorization': ' Bearer $token'
    },
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

Future<Map<String, dynamic>> fetcheditprofile(
  token,
  name,
  phonenumber,
  email,
  dob,
  postalcode,
  address,
  city,
  province,
  country,
) async {
  var body = {
    'name': name,
    'phone': phonenumber,
    'email': email,
    'dob': dob,
    'postcode': postalcode,
    'address': address,
    'state': province,
    'city': city,
    'country': country,
  };
  final response = await http.post(
    Uri.parse(AppUrls.editprofile),
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
  print("responseData is $responseData");
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}
