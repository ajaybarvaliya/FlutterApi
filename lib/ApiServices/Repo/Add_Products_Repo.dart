import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Api_Routes.dart';

class GetProductsRepo {
  static Future<dynamic> getProductsRepo() async {
    var data;
    http.Response response = await http.get(
      Uri.parse(ApiRoutes.getProducts),
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("${response.body}");
    } else {
      print("${response.statusCode}");
    }
    return data;
  }

  static Future<dynamic> addProductsRepo(String title) async {
    var data;
    http.Response response =
        await http.post(Uri.parse(ApiRoutes.getProducts), body: {
      "title": title,
    });
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("${response.body}");
    } else {
      print("${response.statusCode}");
    }
    return data;
  }
}
