import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetProductDemo extends StatefulWidget {
  const GetProductDemo({Key? key}) : super(key: key);

  @override
  State<GetProductDemo> createState() => _GetProductDemoState();
}

class _GetProductDemoState extends State<GetProductDemo> {
  var data;
  Future getData() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${response.body}");
    } else {
      print("RESPONSE ${response.statusCode}");
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("User Id : "),
                          Text("${snapshot.data[index]["userId"]}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Id : "),
                          Text("${snapshot.data[index]["id"]}"),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("title : "),
                          Container(
                              width: 300,
                              child: Text("${snapshot.data[index]["title"]}")),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Body : "),
                          Container(
                              width: 300,
                              child: Text("${snapshot.data[index]["body"]}")),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
