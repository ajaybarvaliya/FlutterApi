import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteApi extends StatefulWidget {
  const DeleteApi({Key? key}) : super(key: key);

  @override
  State<DeleteApi> createState() => _DeleteApiState();
}

class _DeleteApiState extends State<DeleteApi> {
  TextEditingController titlecontroller = TextEditingController();

  bool error = false;
  bool Loading = false;

  Future loading() async {
    setState(() {
      Loading = true;
    });
    http.Response response = await http.delete(
      Uri.parse("https://dummyjson.com/products/1"),
    );
    if (response.statusCode == 200) {
      setState(() {
        Loading = false;
      });
      print("StatusCode ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(" delete success"),
        ),
      );
    } else {
      setState(() {
        print("StatusCode ${response.statusCode}");
        Loading = false;
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: error
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
                              loading();
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
                              "Delete",
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
