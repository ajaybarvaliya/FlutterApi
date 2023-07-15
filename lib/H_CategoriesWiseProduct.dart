import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'H_Productdetails.dart';

class CategoriesWiseProduct extends StatefulWidget {
  CategoriesWiseProduct({Key? key, required this.categoriesproduct})
      : super(key: key);
  var categoriesproduct;

  @override
  State<CategoriesWiseProduct> createState() => _CategoriesWiseProductState();
}

class _CategoriesWiseProductState extends State<CategoriesWiseProduct> {
  var data;
  Future getcategories() async {
    print('${widget.categoriesproduct}');
    http.Response responce = await http.get(Uri.parse(
        "https://dummyjson.com/products/category/${widget.categoriesproduct}"));

    if (responce.statusCode == 200) {
      data = jsonDecode(responce.body);
      print("RESPONCE ${responce.body}");
    } else {
      print("RESPONSE ${responce.statusCode}");
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getcategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              itemCount: data["products"].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Productsdetail(id: data["products"][index]["id"]),
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 200,
                    color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${snapshot.data["products"][index]["thumbnail"]}"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Id :${snapshot.data["products"][index]["id"]}"),
                        Text(
                            "Title :${snapshot.data["products"][index]["title"]}"),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
