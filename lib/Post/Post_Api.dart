import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApi extends StatefulWidget {
  const PostApi({Key? key}) : super(key: key);

  @override
  State<PostApi> createState() => _PostApiState();
}

TextEditingController addcontroller = TextEditingController();

class _PostApiState extends State<PostApi> {
  bool Loading = false;
  bool hasherror = false;

  Future login(String title) async {
    setState(() {
      Loading = true;
    });
    http.Response response = await http.post(
      Uri.parse("https://dummyjson.com/products/add"),
      body: {
        "title": title,
      },
    );

    if (response.statusCode == 200) {
      print("StatusCode ${response.body}");
      setState(() {
        Loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("success"),
        ),
      );
    } else {
      print("StatusCode ${response.statusCode}");

      setState(
        () {
          Loading = false;
          hasherror = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hasherror
          ? Text("Error")
          : Loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      TextField(
                        controller: addcontroller,
                        decoration: InputDecoration(
                          labelText: "Title add",
                          constraints: BoxConstraints(maxWidth: 300),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            login(addcontroller.text);
                            Loading = false;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          color: Colors.brown,
                          child: Center(
                            child: Text("Add",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
