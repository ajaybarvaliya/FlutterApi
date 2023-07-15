import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Patch_Api extends StatefulWidget {
  const Patch_Api({Key? key}) : super(key: key);

  @override
  State<Patch_Api> createState() => _Patch_ApiState();
}

class _Patch_ApiState extends State<Patch_Api> {
  TextEditingController titlecontroller = TextEditingController();
  bool hasError = false;
  bool Loading = false;

  Future loading(String title) async {
    setState(() {
      Loading = true;
    });
    http.Response response = await http.patch(
      Uri.parse("https://dummyjson.com/products/1"),
      body: {
        "title": title,
      },
    );
    if (response.statusCode == 200) {
      print("StatusCode ${response.body}");
      print("title : $title");
      setState(() {
        Loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("success"),
        ),
      );
    } else {
      setState(() {
        print("StatusCode ${response.statusCode}");
        Loading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hasError
          ? Text("Error")
          : Loading
              ? CircularProgressIndicator()
              : Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      TextField(
                        controller: titlecontroller,
                        decoration: InputDecoration(
                          labelText: "Title add",
                          constraints: BoxConstraints(maxWidth: 300),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              loading(
                                titlecontroller.text,
                              );
                              Loading = false;
                            },
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          color: Colors.brown,
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
