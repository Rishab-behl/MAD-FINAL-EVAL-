import 'package:ecomm_app/screens/add_product.dart';
import 'package:ecomm_app/screens/cart_screen.dart';
import 'package:ecomm_app/screens/login.dart';
import 'package:ecomm_app/screens/products.dart';
import 'package:ecomm_app/screens/register.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/addproduct': (context) => AddProduct(),
    '/productScreen': ((context) => ProductScreen()),
    '/cartScreen': (((context) => CartScreen(
          cartItems: [],
        )))
  };
}
