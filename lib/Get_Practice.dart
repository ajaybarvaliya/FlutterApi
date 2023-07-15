import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Get_Practice extends StatefulWidget {
  const Get_Practice({Key? key}) : super(key: key);

  @override
  State<Get_Practice> createState() => _Get_PracticeState();
}

class _Get_PracticeState extends State<Get_Practice> {
  var data;
  Future getData() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/users"));

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
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("address : "),
                        Text(
                            "[ lat : ${snapshot.data[index]["address"]["geolocation"]["lat"]},"),
                        Text(
                            " long : ${snapshot.data[index]["address"]["geolocation"]["long"]} ]"),
                      ],
                    ),
                    Text("id : ${snapshot.data[index]["id"]}"),
                    Text("email : ${snapshot.data[index]["email"]}"),
                    Text("username : ${snapshot.data[index]["username"]}"),
                    Text("password : ${snapshot.data[index]["password"]}"),
                    Row(
                      children: [
                        Text("name : "),
                        Text(
                            "[ firstname : ${snapshot.data[index]["name"]["firstname"]},"),
                        Text(
                            " lastname : ${snapshot.data[index]["name"]["lastname"]} ]"),
                      ],
                    ),
                    Text("phone : ${snapshot.data[index]["phone"]}"),
                    Text("__v : ${snapshot.data[index]["__v"]}"),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
