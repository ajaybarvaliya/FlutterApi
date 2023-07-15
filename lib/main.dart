import 'package:flutter/material.dart';

import 'Delete/DeleteApi.dart';
import 'Dynamic_ui.dart';

import 'H_Categories.dart';
import 'H_CategoriesWiseProduct.dart';
import 'H_Productdetails.dart';
import 'Model/Responce/Posts/all_posts.dart';
import 'Model/Responce/all_user.dart';
import 'Patch/Patch_Api.dart';
import 'Post/Api_task.dart';
import 'Post/Post_Api.dart';
import 'Put/Put_api.dart';
import 'get_product.dart';
import 'map_api.dart';
import 'map_api2.dart';
import 'Homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
