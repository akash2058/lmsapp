import 'dart:convert';
import 'dart:io';

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
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}

Future<Map<String, dynamic>> fetchMyPurchaseCourse(token) async {
  final response = await http.get(
    Uri.parse(AppUrls.getmycourse),
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

Future<Map<String, dynamic>> fetchPayment(token) async {
  final response = await http.get(
    Uri.parse(AppUrls.paymentapi),
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

Future<Map<String, dynamic>> fetchCoursePlaylist(token, id) async {
  final response = await http.post(
    Uri.parse('${AppUrls.courseplaylist}$id'),
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

Future<Map<String, dynamic>> fetcheditprofile(
  String token,
  String name,
  String phonenumber,
  String dob,
  String postalcode,
  String address,
  String city,
  String province,
  String country,
  String email,
  File? photo, // Updated parameter to accept File type for the image
) async {
  // Create a multipart request
  var request = http.MultipartRequest('POST', Uri.parse(AppUrls.editprofile));

  request.fields['name'] = name;
  request.fields['phone'] = phonenumber;
  request.fields['dob'] = dob;
  request.fields['postcode'] = postalcode;
  request.fields['address'] = address;
  request.fields['state'] = province;
  request.fields['city'] = city;
  request.fields['country'] = country;
  request.fields['email'] = email;

  // Add the image file to the request if available
  if (photo != null) {
    var photoStream = http.ByteStream(photo.openRead());
    var length = await photo.length();
    var multipartFile = http.MultipartFile(
      'photo',
      photoStream,
      length,
      filename: photo.path.split('/').last,
    );
    request.files.add(multipartFile);
  }

  // Add authorization header
  request.headers['Authorization'] = 'Bearer $token';

  // Send the request
  var streamedResponse = await request.send();

  // Get response from streamed response
  var response = await http.Response.fromStream(streamedResponse);

  // Decode response JSON
  var responseData = jsonDecode(response.body);

  // Check response status
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }

  // Return response data
  return responseData;
}

Future<Map<String, dynamic>> fetchcoursedata(token, id) async {
  final response = await http.get(
    Uri.parse('${AppUrls.coursedetails}$id'),
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

Future<Map<String, dynamic>> fetchUpcomingtest(
  token,
) async {
  final response = await http.get(
    Uri.parse(AppUrls.upcomingtest),
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

Future<Map<String, dynamic>> fetchaddwishlist(token, id) async {
  var body = {'course_id': id};
  final response = await http.post(
    Uri.parse(AppUrls.addwishlists),
    body: body,
    headers: {
      // 'Content-Type': 'application/json',
      'Authorization': ' Bearer $token'
    },
  );

  final Map<String, dynamic> responseData = jsonDecode(response.body);
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}

Future<Map<String, dynamic>> fetchremoveaddwishlist(token, id) async {
  var body = {'wishlist_id': id};
  final response = await http.post(
    Uri.parse(AppUrls.removewishlists),
    body: body,
    headers: {
      // 'Content-Type': 'application/json',
      'Authorization': ' Bearer $token'
    },
  );

  final Map<String, dynamic> responseData = jsonDecode(response.body);
  if (responseData['status'] == false) {
    throw Exception(responseData['status_message']);
  }
  return responseData;
}
