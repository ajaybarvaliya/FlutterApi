// To parse this JSON data, do
//
//     final postsDetails = postsDetailsFromJson(jsonString);

import 'dart:convert';

List<PostsDetails> postsDetailsFromJson(String str) => List<PostsDetails>.from(
    json.decode(str).map((x) => PostsDetails.fromJson(x)));

String postsDetailsToJson(List<PostsDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsDetails {
  int userId;
  int id;
  String title;
  String body;

  PostsDetails({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsDetails.fromJson(Map<String, dynamic> json) => PostsDetails(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
