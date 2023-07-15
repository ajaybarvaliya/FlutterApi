import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class All_Users_Details extends StatefulWidget {
  All_Users_Details({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<All_Users_Details> createState() => _All_Users_DetailsState();
}

class _All_Users_DetailsState extends State<All_Users_Details>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  void initState() {
    tabController = TabController(length: 5, vsync: this);
  }

  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  var data;
  Future getuser() async {
    http.Response responce =
        await http.get(Uri.parse("https://dummyjson.com/users/${widget.id}"));

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
      appBar: AppBar(
        backgroundColor: Colors.brown.withOpacity(0.9),
        title: Text(
          "All Users Details",
          style: TextStyle(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
            indicatorWeight: 2,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 10),
            controller: tabController,
            tabs: [
              Text("General"),
              Text("Hair"),
              Text("Address"),
              Text("Bank"),
              Text("Company"),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
              future: getuser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.brown),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${data["image"]}"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("Id :${snapshot.data["id"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("firstName :${snapshot.data["firstName"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("lastName :${snapshot.data["lastName"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("maidenName :${snapshot.data["maidenName"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("age :${snapshot.data["age"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("gender :${snapshot.data["gender"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("email :${snapshot.data["email"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("phone :${snapshot.data["phone"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("username :${snapshot.data["username"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("password :${snapshot.data["password"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("birthDate :${snapshot.data["birthDate"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("bloodGroup :${snapshot.data["bloodGroup"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("height :${snapshot.data["height"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("weight :${snapshot.data["weight"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("eyeColor :${snapshot.data["eyeColor"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("domain :${snapshot.data["domain"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("ip :${snapshot.data["ip"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("macAddress :${snapshot.data["macAddress"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("university :${snapshot.data["university"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("ein :${snapshot.data["ein"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("ssn :${snapshot.data["ssn"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("userAgent :${snapshot.data["userAgent"]}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          FutureBuilder(
            future: getuser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color :${data["hair"]["color"]}"),
                    Text("type :${data["hair"]["type"]}"),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder(
            future: getuser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address :${data["address"]["address"]}"),
                    Text("City :${data["address"]["city"]}"),
                    Text("lat :${data["address"]["coordinates"]["lat"]}"),
                    Text("lng :${data["address"]["coordinates"]["lng"]}"),
                    Text("PostalCode :${data["address"]["postalCode"]}"),
                    Text("Satate :${data["address"]["state"]}")
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder(
            future: getuser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CardExpire :${data["bank"]["cardExpire"]}"),
                    Text("CardNumber :${data["bank"]["cardNumber"]}"),
                    Text("CardType :${data["bank"]["cardType"]}"),
                    Text("Currency :${data["bank"]["currency"]}"),
                    Text("Iban :${data["bank"]["iban"]}"),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder(
            future: getuser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address :${data["company"]["address"]["address"]}"),
                    Text("City :${data["company"]["address"]["city"]}"),
                    Text(
                        "lat :${data["company"]["address"]["coordinates"]["lat"]}"),
                    Text(
                        "lng :${data["company"]["address"]["coordinates"]["lng"]}"),
                    Text(
                        "PostalCode :${data["company"]["address"]["postalCode"]}"),
                    Text("State :${data["company"]["address"]["state"]}"),
                    Text("Department :${data["company"]["department"]}"),
                    Text("Name :${data["company"]["name"]}"),
                    Text("Title :${data["company"]["title"]}"),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
