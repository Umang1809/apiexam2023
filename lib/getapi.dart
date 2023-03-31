import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class getapi extends StatefulWidget {
  const getapi({Key? key}) : super(key: key);

  @override
  State<getapi> createState() => _getapiState();
}

class _getapiState extends State<getapi> {
  resultt? rr;
  int topindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getApi();
  }

  Future<void> getApi() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> mapp = jsonDecode(response.body);
    setState(() {
      rr = resultt.fromJson(mapp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ));
        },
        child: Icon(Icons.home_filled),
      ),
      appBar: AppBar(
        title: Center(child: Text("QUE 2 GET API ")),
      ),
      body: rr == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.black26,
              child: ListView.builder(
                itemCount: rr!.products!.length,
                itemBuilder: (context, index) {
                  topindex = index;

                  return Container(
                    margin: EdgeInsets.all(50),
                    color: Colors.black38,
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: 600,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1),
                            itemCount: rr!.products![topindex].images!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.white60,
                                child: Image(
                                    image: NetworkImage(
                                        "${rr!.products![topindex].images![index]}")),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ID : ${rr!.products![index].id}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("TITLE : ${rr!.products![index].title}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "DESCRIPTION : ${rr!.products![index].description}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("PRISE : ${rr!.products![index].price}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "DISCOUNT PER % : ${rr!.products![index].discountPercentage}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("RATING : ${rr!.products![index].rating}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("STOCK : ${rr!.products![index].stock}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("BRAND : ${rr!.products![index].brand}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "CATEGORY : ${rr!.products![index].category}"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class resultt {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  resultt({this.products, this.total, this.skip, this.limit});

  resultt.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  var price;
  double? discountPercentage;
  var rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
