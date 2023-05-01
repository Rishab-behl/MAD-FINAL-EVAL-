import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key, required this.cartItems});

  List<Cart> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("CART"),
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
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) => cartCard(index),
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

  Widget cartCard(int index) {
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
              child: Image.asset(cartItems[index].image),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(18.0, 5, 0, 0),
                  width: 195.0,
                  child: Text(
                    cartItems[index].name,
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
                    '₹${cartItems[index].price}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
