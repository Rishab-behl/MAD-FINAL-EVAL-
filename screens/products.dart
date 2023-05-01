import 'package:ecomm_app/models/product.dart';
import 'package:ecomm_app/providers/addToCart.dart';
import 'package:ecomm_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  // list of products
  List<String> products = [
    "Iphone 14 pro Max",
    "Iphone 14 pro",
    "Iphone 13 pro Max",
    "Iphone 13 pro",
    "Series 7 Watch",
    "Air pods pro 2",
    "MacBook Air M2",
  ];

  List<String> images = [
    ProductImages.I14PM,
    ProductImages.I14P,
    ProductImages.I13PM,
    ProductImages.I13P,
    ProductImages.W7,
    ProductImages.PODS,
    ProductImages.MAC
  ];

  List<String> prices = [
    "1,30,000",
    "1,20,000",
    "1,00,000",
    "90,000",
    "45,000",
    "24,000",
    "96,000",
  ];

  // array of cart items
  List<Cart> cartItems = [];

  @override
  Widget build(BuildContext context) {
    AddToCart atc = Provider.of<AddToCart>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Catalogue",
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, constantRoutes.CART,
                    arguments: cartItems); // <-- integrate cart screen
              },
            ),
            const SizedBox(width: 20)
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              children: [
                const Divider(
                  color: Colors.black,
                  indent: 22,
                  endIndent: 22,
                  height: 25,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) => cartCard(index, atc),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  indent: 22,
                  endIndent: 22,
                  height: 25,
                ),
              ],
            )));
  }

  Widget cartCard(int index, AddToCart atc) {
    Cart cartProd =
        Cart(name: products[index], price: prices[index], image: images[index]);
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
      child: Container(
        height: 70.0,
        width: 60.0,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    blurStyle: BlurStyle.outer)
              ], borderRadius: BorderRadius.circular(10)),
              width: 80.0,
              height: 70.0,
              child: Image.asset(images[index]),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(18.0, 5, 0, 0),
                  width: 195.0,
                  child: Text(
                    products[index],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 0),
                  width: 195.0,
                  child: Text(
                    '₹${prices[index]}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    atc.toggleTapped(index);
                    print(index);
                  },
                  child: atc.isTapped(index) ? tick(cartProd) : addText(),
                )),
          ],
        ),
      ),
    );
  }

  Widget addText() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
        width: 73.0,
        height: 25.0,
        child: const Center(
          child: Text(
            "ADD",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget tick(Cart cartProd) {
    cartItems.add(cartProd);
    return Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
        width: 73.0,
        height: 25.0,
        child: const Center(
            child: Icon(
          Icons.check,
          color: Colors.white,
        )));
  }
}
