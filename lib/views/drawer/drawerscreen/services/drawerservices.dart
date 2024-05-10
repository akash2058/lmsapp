import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lmsapp/utilities/apiurls.dart';

Future<Map<String, dynamic>> fetchAboutus(token) async {
  try {
    final response = await http.get(
      Uri.parse(AppUrls.aboutus),
      headers: {
        // 'Content-Type': 'application/json',
        'Authorization': ' Bearer ${token}'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print("gila  $data");
      return data;
    } else {
      throw Exception('Failed to get data');
    }
  } catch (e) {
    throw Exception('Failed to get data');
  }
}

Future<Map<String, dynamic>> fetchPrivacyPolicy(token) async {
  try {
    final response = await http.get(
      Uri.parse(AppUrls.policy),
      headers: {
        // 'Content-Type': 'application/json',
        'Authorization': ' Bearer ${token}'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print("gila  $data");
      return data;
    } else {
      throw Exception('Failed to get data');
    }
  } catch (e) {
    throw Exception('Failed to get data');
  }
}
