import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nodejs_tut/riverpod_get_post/model/api_response_model.dart';
import 'package:nodejs_tut/riverpod_get_post/model/create_user_model.dart';

class Apihelper {
  static final String url = "https://reqres.in/api/unknown";

  // GET request
  static Future<ApiResponseModel> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'x-api-key': 'reqres-free-v1'},
      );

      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        ApiResponseModel apiResponse = ApiResponseModel.fromJson(data);
        return apiResponse;
      } else {
        print('Status Code: ${response.statusCode}');
        throw Exception(
          "Failed to load data. Status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Failed to fetch data: $e");
    }
  }

  //post request
  static createUser({required String name, required String job}) async {
    Map<String, dynamic> body = {"name": name, "job": job};
    var response = await http.post(
      Uri.parse("https://reqres.in/api/users"),

      headers: {
        "Content-Type": "application/json",
        "x-api-key": "reqres-free-v1",
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      CreateUserResponse apiResponse = CreateUserResponse.fromJson(data);
      return apiResponse;
    } else {
      print(response.statusCode);
      throw Exception(
        "Failed to Create User. Status code: ${response.statusCode}",
      );
    }
  }
}
