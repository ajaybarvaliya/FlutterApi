import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../All_Users_Details.dart';
import 'User_responce_details.dart';
import 'all_user_details.dart';

class allusers extends StatefulWidget {
  const allusers({Key? key}) : super(key: key);

  @override
  State<allusers> createState() => _allusersState();
}

class _allusersState extends State<allusers> {
  Future<Userresponcemodel> getuser() async {
    Userresponcemodel? userResponceModel;
    http.Response responce =
        await http.get(Uri.parse("https://dummyjson.com/users"));

    if (responce.statusCode == 200) {
      userResponceModel = userresponcemodelFromJson(responce.body);
    } else {
      print("RESPONSE ${responce.statusCode}");
    }
    return userResponceModel!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Userresponcemodel>(
        future: getuser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: snapshot.data!.users.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => alluserdetails(
                          id: snapshot.data!.users[index].id,
                        ),
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
                            "FirstName :${snapshot.data!.users[index].firstName}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "LastName :${snapshot.data!.users[index].lastName}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Email :${snapshot.data!.users[index].email}",
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
