import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/screens/checkout_screen.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class POSScreen extends StatefulWidget {
  POSScreen({Key? key}) : super(key: key);

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  List products = [
    {
      "product_name": "Banana",
      "product_price": 663.00,
      "product_image":
          "https://image.makewebeasy.net/makeweb/r_1200x0/K5HN2G4Kq/fruitflavour/banana.jpg",
    },
    {
      "product_name": "Strawbery",
      "product_price": 230,
      "product_image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTvlyRK1DdUBMUM-e6JWFYl8OaJsKgbpQSGQ&usqp=CAU",
    },
    {
      "product_name": "Banana",
      "product_price": 300,
      "product_image":
          "https://image.makewebeasy.net/makeweb/r_1200x0/K5HN2G4Kq/fruitflavour/banana.jpg",
    },
    {
      "product_name": "Strawberyy",
      "product_price": 200,
      "product_image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTvlyRK1DdUBMUM-e6JWFYl8OaJsKgbpQSGQ&usqp=CAU",
    },
    {
      "product_name": "Banana",
      "product_price": 100,
      "product_image":
          "https://image.makewebeasy.net/makeweb/r_1200x0/K5HN2G4Kq/fruitflavour/banana.jpg",
    },
    {
      "product_name": "Strawberyy",
      "product_price": 230,
      "product_image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTvlyRK1DdUBMUM-e6JWFYl8OaJsKgbpQSGQ&usqp=CAU",
    },
  ];
  List productCart = [];

  _addProductToCart(product) {
    productCart.add(product);
    print(productCart);
    print(productCart.length);
  }

  getProductCart() {
    return productCart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          appBarTitle: 'Products',
        ),
      ),
      body: GridView.builder(
          itemCount: products.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: (context, index) {
            var product = products[index];
            return Card(
              child: InkWell(
                onTap: () {
                  _addProductToCart(product);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Image.network(
                                "${product['product_image']}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.black54,
                                  child: Text(
                                    '${product['product_price']} ฿',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('${product['product_name']}'),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
