import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nodejs_tut/practice/api_response_model.dart';
import 'package:nodejs_tut/practice/create_user_model.dart';

class Apihelper {
  static final String url = "https://reqres.in/api/unknown";
  //get request
  static Future<ApiResponseModel> fetchData() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        ApiResponseModel apiResponse = ApiResponseModel.fromJson(data);
        return apiResponse;
      } else {
        print(response.statusCode);
        throw Exception(
          "Failed to load data. Status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      print(e);
      throw Exception("Failed to fetch data: $e");
    }
  }

  //post request
  static createUser({required String name, required String job}) async {
    Map<String, dynamic> body = {"name": name, "job": job};
    var response = await http.post(
      Uri.parse("https://reqres.in/api/users"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
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
