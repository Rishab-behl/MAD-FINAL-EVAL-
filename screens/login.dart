import 'package:ecomm_app/models/message.dart';
import 'package:ecomm_app/models/seller.dart';
import 'package:ecomm_app/services/seller_operations.dart';
import 'package:ecomm_app/utils/constants.dart';
import 'package:ecomm_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            Constants.login_image,
            height: 200,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.login),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                labelText: 'Password',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Seller seller = Seller.takeInput(
                        userId: nameController.text,
                        appId: "A111",
                        password: passwordController.text);
                    SellerOperations sellerOps = SellerOperations();
                    Message mess = await sellerOps.read(seller);
                    createToast(mess.message, context);
                    Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, constantRoutes.PRODUCTS);
                  },
                  child: const Text('Login')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, constantRoutes.REGISTER);
                  },
                  child: const Text('Register'))
            ],
          )
        ],
      ),
    )));
  }
}
