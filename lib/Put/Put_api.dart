import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutApi extends StatefulWidget {
  const PutApi({Key? key}) : super(key: key);

  @override
  State<PutApi> createState() => _PutApiState();
}

class _PutApiState extends State<PutApi> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController();

    bool error = false;
    bool Loading = false;
    Future loading(String title) async {
      setState(() {
        Loading = true;
      });
      http.Response response = await http.put(
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
          error = true;
        });
      }
    }

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
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              loading(titlecontroller.text);
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
