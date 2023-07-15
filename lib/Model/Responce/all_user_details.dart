import 'dart:convert';

import 'package:api/Dynamic_ui.dart';
import 'package:api/Model/Responce/User_responce_details.dart';
import 'package:api/Model/Responce/one_user_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class alluserdetails extends StatefulWidget {
  alluserdetails({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<alluserdetails> createState() => _alluserdetailsState();
}

class _alluserdetailsState extends State<alluserdetails>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  void initState() {
    tabController = TabController(length: 5, vsync: this);
  }

  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  Future<OneUsersDetails> getuser() async {
    OneUsersDetails? oneUsersDetails;
    http.Response responce =
        await http.get(Uri.parse("https://dummyjson.com/users/${widget.id}"));

    if (responce.statusCode == 200) {
      oneUsersDetails = oneUsersDetailsFromJson(responce.body);
    } else {
      print("RESPONSE ${responce.statusCode}");
    }

    return oneUsersDetails!;
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
            child: FutureBuilder<OneUsersDetails>(
              future: getuser(),
              builder: (context, snapshot) {
                OneUsersDetails? data = snapshot.data;

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
                                image: NetworkImage("${data?.image}"),
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
                        Text("Id :${data?.id}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("firstName :${data?.firstName}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("lastName :${data?.lastName}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("maidenName :${data?.maidenName}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("age :${data?.age}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("gender :${data?.gender}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("email :${data?.email}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("phone :${data?.phone}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("username :${data?.username}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("password :${data?.password}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("birthDate :${data?.birthDate}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("bloodGroup :${data?.bloodGroup}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("height :${data?.height}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("weight :${data?.weight}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("eyeColor :${data?.eyeColor}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("domain :${data?.domain}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("ip :${data?.ip}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("macAddress :${data?.macAddress}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("university :${data?.university}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("ein :${data?.ein}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("ssn :${data?.ssn}"),
                        Divider(
                          height: 8,
                          color: Colors.black,
                          endIndent: 3,
                          indent: 3,
                          thickness: 0.4,
                        ),
                        Text("userAgent :${data?.userAgent}"),
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
          FutureBuilder<OneUsersDetails>(
            future: getuser(),
            builder: (context, snapshot) {
              OneUsersDetails? data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color :${data?.hair.color}"),
                    Text("type :${data?.hair.type}"),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder<OneUsersDetails>(
            future: getuser(),
            builder: (context, snapshot) {
              OneUsersDetails? data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address :${data?.address.address}"),
                    Text("City :${data?.address.city}"),
                    Text("lat :${data?.address.coordinates.lat}"),
                    Text("lng :${data?.address.coordinates.lng}"),
                    Text("PostalCode :${data?.address.city}"),
                    Text("Satate :${data?.address.state}")
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
              OneUsersDetails? data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CardExpire :${data?.bank.cardExpire}"),
                    Text("CardNumber :${data?.bank.cardNumber}"),
                    Text("CardType :${data?.bank.cardExpire}"),
                    Text("Currency :${data?.bank.currency}"),
                    Text("Iban :${data?.bank.iban}"),
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
                    Text("Address :${snapshot.data?.company.address.address}"),
                    Text("City :${snapshot.data?.company.address.city}"),
                    Text(
                        "lat :${snapshot.data?.company.address.coordinates.lat}"),
                    Text("lng :${snapshot.data?.address.coordinates.lng}"),
                    Text("PostalCode :${snapshot.data?.address.postalCode}"),
                    Text("State :${snapshot.data?.address.state}"),
                    Text("Department :${snapshot.data?.company.department}"),
                    Text("Name :${snapshot.data?.company.name}"),
                    Text("Title :${snapshot.data?.company.title}"),
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
