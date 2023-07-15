import 'dart:convert';

import 'package:api/Dynamic_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Productsdetail extends StatefulWidget {
  const Productsdetail({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<Productsdetail> createState() => _ProductsdetailState();
}

class _ProductsdetailState extends State<Productsdetail> {
  var productdetail;

  Future getdata() async {
    http.Response responce = await http
        .get(Uri.parse("https://dummyjson.com/products/${widget.id}"));

    if (responce.statusCode == 200) {
      productdetail = jsonDecode(responce.body);
      print("RESPONCE ${responce.body}");
    } else {
      print("RESPONSE ${responce.statusCode}");
    }

    return productdetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 300,
                //   child: PageView.builder(
                //     itemCount: productdetail["images"].length,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         height: 300,
                //         width: 360,
                //         child: Image.network(
                //           "${productdetail["images"][index]}",
                //           fit: BoxFit.cover,
                //         ),
                //       );
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id :${snapshot.data["id"]}"),
                      Text("Title :${snapshot.data["title"]}"),
                      Text("Price :${snapshot.data["price"]}"),
                      Text("Brand :${snapshot.data["brand"]}"),
                      Text("Rating :${snapshot.data["rating"]}"),
                      Text("Description :${snapshot.data["description"]}"),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
