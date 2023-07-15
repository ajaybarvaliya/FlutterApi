import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'All_Users_Details.dart';

class All_Users extends StatefulWidget {
  const All_Users({Key? key}) : super(key: key);

  @override
  State<All_Users> createState() => _All_UsersState();
}

class _All_UsersState extends State<All_Users> {
  var data;
  Future getuser() async {
    http.Response responce =
        await http.get(Uri.parse("https://dummyjson.com/users"));

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
        future: getuser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: data["users"].length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            All_Users_Details(id: data["users"][index]["id"]),
                      ),
                    );
                  },
                  child: Container(
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "FirstName :${data["users"][index]["firstName"]}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "LastName :${data["users"][index]["lastName"]}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Email :${data["users"][index]["email"]}",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "Loading...",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown,
                    fontWeight: FontWeight.w500),
              ),
            );
          }
        },
      ),
    );
  }
}
