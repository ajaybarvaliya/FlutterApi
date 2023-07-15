import 'dart:convert';

import 'package:api/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ApiServices/Api_Routes.dart';
import 'ApiServices/Repo/Add_Products_Repo.dart';
import 'map_api2.dart';

class MapApi extends StatefulWidget {
  MapApi({Key? key}) : super(key: key);

  @override
  State<MapApi> createState() => _MapApiState();
}

class _MapApiState extends State<MapApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: GetProductsRepo.getProductsRepo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              itemCount: snapshot.data["products"].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapApi2(id: snapshot.data["products"][index]["id"]),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                      border: Border.all(color: Colors.black38, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 180,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "${snapshot.data["products"][index]["thumbnail"]}",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Id : ${snapshot.data["products"][index]["id"]}"),
                              Text(
                                  "Titel : ${snapshot.data["products"][index]["title"]}"),
                              Text(
                                  "Price : ${snapshot.data["products"][index]["price"]}"),
                              Text(
                                  "Brand : ${snapshot.data["products"][index]["brand"]}"),
                              Text(
                                  "Rating : ${snapshot.data["products"][index]["rating"]}"),
                              Text(
                                  "Description : ${snapshot.data["products"][index]["description"]}"),
                            ],
                          ),
                        ),
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
