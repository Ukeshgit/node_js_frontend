import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nodejs_tut/constant/constants.dart';

class Apihelper {
  static String addUrl = "/api/add_product";
  void addProduct({
    required String pname,
    required String pprice,
    required String pdesc,
  }) async {
    Uri url = Uri.parse(Constants.baseurl + addUrl);
    Map<String, dynamic> product = {
      "pname": pname,
      "pprice": pprice,
      "pdesc": pdesc,
    };
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product),
      );
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("Failed to add product. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error is : $e");
    }
  }
}
