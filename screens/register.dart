import 'package:ecomm_app/models/message.dart';
import 'package:ecomm_app/models/seller.dart';
import 'package:ecomm_app/services/seller_operations.dart';
import 'package:ecomm_app/utils/toast.dart';
import 'package:flutter/material.dart';
// import 'package:ecomm_ap';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController appIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.network(
            'https://cdni.iconscout.com/illustration/premium/thumb/job-starting-date-2537382-2146478.png',
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
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: appIdController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                labelText: 'App Id',
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
                        password: passwordController.text,
                        appId: appIdController.text);

                    SellerOperations sellerOps = SellerOperations();
                    Message message = await sellerOps.add(seller);
                    createToast(message.message, context);
                  },
                  child: const Text('Register')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          )
        ],
      )),
    );
  }
}
