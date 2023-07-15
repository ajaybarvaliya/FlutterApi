import 'dart:convert';
import 'package:api/Dynamic_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'H_CategoriesWiseProduct.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, this.allcategories}) : super(key: key);
  final allcategories;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: widget.allcategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesWiseProduct(
                          categoriesproduct: widget.allcategories[index]),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "${widget.allcategories![index]}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
