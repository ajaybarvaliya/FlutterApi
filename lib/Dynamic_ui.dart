import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dynamic_ui extends StatefulWidget {
  const Dynamic_ui({Key? key}) : super(key: key);

  @override
  State<Dynamic_ui> createState() => _Dynamic_uiState();
}

List data = [
  {
    "title": "Banner",
    "value": [
      {
        "image":
            "https://kddi-h.assetsadobe3.com/is/image/content/dam/au-com/mobile/mb_img_58.jpg?scl=1",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBwbGUlMjBsYXB0b3B8ZW58MHx8MHx8&w=1000&q=80",
      },
      {
        "image":
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-10th-gen-finish-select-202212-yellow-wifi_AV1_GEO_EMEA_FMT_WHH?wid=1280&hei=720&fmt=p-jpg&qlt=95&.v=1670859518435",
      },
    ],
  }, //Banner
  {
    "title": "Category",
    "value": [
      {
        "id": 1,
        "name": "Mobile",
        "image":
            "https://kddi-h.assetsadobe3.com/is/image/content/dam/au-com/mobile/mb_img_58.jpg?scl=1",
      },
      {
        "id": 2,
        "name": "Laptop",
        "image":
            "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBwbGUlMjBsYXB0b3B8ZW58MHx8MHx8&w=1000&q=80",
      },
      {
        "id": 3,
        "name": "Ipad",
        "image":
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-10th-gen-finish-select-202212-yellow-wifi_AV1_GEO_EMEA_FMT_WHH?wid=1280&hei=720&fmt=p-jpg&qlt=95&.v=1670859518435",
      },
    ],
  }, //Category
  {
    "title": "Product",
    "value": [
      {
        "image":
            "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=329&q=80",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1577979749830-f1d742b96791?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1558888401-3cc1de77652d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1601924357840-3e50ad4dd9fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=394&q=80",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603210119709-26103832d0e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      }
    ],
  }, //Product
];

class _Dynamic_uiState extends State<Dynamic_ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 800,
              width: 360,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, indexes) {
                  return data[indexes]["title"] == "Product"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                "Product",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                                width: 360,
                                height: 340,
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: data[indexes]["value"].length,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1 / 2,
                                          crossAxisSpacing: 5,
                                          mainAxisExtent: 290),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration:
                                          BoxDecoration(color: Colors.yellow),
                                      child: Image.network(
                                        "${data[indexes]["value"][index]["image"]}",
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                )),
                          ],
                        )
                      : data[indexes]["title"] == "Category"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 50, left: 10),
                                  child: Text(
                                    "Category",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 360,
                                  child: ListView.builder(
                                    itemCount: data[indexes]["value"].length,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.only(top: 10, left: 30),
                                        height: 80,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                            child: Text(
                                          " ${data[indexes]["value"][index]["name"]}",
                                          style: TextStyle(fontSize: 17),
                                        )),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Text(
                                    "Banner",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 150,
                                  child: PageView.builder(
                                    itemCount: data[indexes]["value"].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 300,
                                        height: 100,
                                        child: Image.network(
                                            "${data[indexes]["value"][index]["image"]}",
                                            scale: 2.4),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class category extends StatelessWidget {
  const category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: Text(
            "Category",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            itemCount: data[1]["value"].length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10, left: 30),
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  " ${data[1]["value"][index]["name"]}",
                  style: TextStyle(fontSize: 17),
                )),
              );
            },
          ),
        ),
      ],
    );
  }
}

class product extends StatelessWidget {
  const product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "Product",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
            height: 504,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data[0]["value"].length,
              padding: EdgeInsets.only(left: 5, right: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.1,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 290),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Image.network(
                    "${data[0]["value"][index]["image"]}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            )),
      ],
    );
  }
}

class banner extends StatelessWidget {
  const banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "Banner",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 150,
          child: PageView.builder(
            itemCount: data[2]["value"].length,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                height: 100,
                child: Image.network("${data[2]["value"][index]["image"]}",
                    scale: 2.4),
              );
            },
          ),
        ),
      ],
    );
  }
}
