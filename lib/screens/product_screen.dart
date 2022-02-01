import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/models/product_model.dart';
import 'package:flutter_exam_pokedex/models/users_model.dart';
import 'package:flutter_exam_pokedex/services/user_service.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Stream getProducts() async* {
    yield await UserService().getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomAppBar(appBarTitle: 'Product'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: UserService().getProducts(),
            initialData: UserService().getAllProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                        'Something wrong with ${snapshot.error.toString()}'));
              } else if (snapshot.connectionState == ConnectionState.active) {
                return _productList(snapshot.data);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          // child: FutureBuilder(
          //   future: UserService().getAllProduct(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasError) {
          //       return Center(
          //           child: Text(
          //               'Something wrong with ${snapshot.error.toString()}'));
          //     } else if (snapshot.connectionState == ConnectionState.done) {
          //       return _productList(snapshot.data);
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),
        ));
  }

  Widget _productList(products) {
    return ListView.builder(
        itemCount: products.data.length,
        itemBuilder: (BuildContext context, index) {
          var product = products.data[index];
          var imageCover = jsonDecode(product.productImg);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                      "http://" + imageCover['product_img0'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${product.id}-${product.name}",
                        // "id: ${product.id} - ${product.name}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${product.price}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
