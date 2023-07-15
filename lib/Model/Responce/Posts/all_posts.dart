import 'dart:convert';

import 'package:api/Model/Responce/Posts/post_responce.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPostDemo extends StatefulWidget {
  const GetPostDemo({Key? key}) : super(key: key);

  @override
  State<GetPostDemo> createState() => _GetPostDemoState();
}

class _GetPostDemoState extends State<GetPostDemo> {
  Future<List<PostsDetails>> getData() async {
    List<PostsDetails>? postsDetails;

    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      postsDetails = postsDetailsFromJson(response.body);
    } else {
      print("RESPONSE ${response.statusCode}");
    }
    return postsDetails!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PostsDetails>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              // shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {

                PostsDetails data = snapshot.data![index];

                return Container(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("User Id : "),
                          Text("${data.userId}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Id : "),
                          Text("${data.id}"),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("title : "),
                          Container(width: 300, child: Text("${data.title}")),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Body : "),
                          Container(width: 300, child: Text("${data.body}")),
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
