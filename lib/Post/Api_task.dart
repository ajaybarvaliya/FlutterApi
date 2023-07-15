import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApiTask extends StatefulWidget {
  const PostApiTask({Key? key}) : super(key: key);

  @override
  State<PostApiTask> createState() => _PostApiTaskState();
}

class _PostApiTaskState extends State<PostApiTask> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController bodycontroller = TextEditingController();

  bool error = false;
  bool Loading = false;
  Future loading(String title, String body) async {
    setState(() {
      Loading = true;
    });
    http.Response response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      body: {
        "title": title,
        "body": body,
      },
    );

    if (response.statusCode == 201) {
      print("StatusCode ${response.statusCode}");
      print("title : $title");
      print("body : $body");
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

      setState(() {
        Loading = false;
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: error
          ? Center(child: Text("Error"))
          : Loading
              ? Center(child: CircularProgressIndicator())
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
                      TextField(
                        controller: bodycontroller,
                        decoration: InputDecoration(
                          labelText: "body add",
                          constraints: BoxConstraints(maxWidth: 300),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              loading(
                                  titlecontroller.text, bodycontroller.text);
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
