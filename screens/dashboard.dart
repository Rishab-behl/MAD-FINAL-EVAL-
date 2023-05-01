import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController Id = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController qua = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('User Id'),
            ),
            ListTile(
              title: const Text('Add Product'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DASHBOARD'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Add Product',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              const Text('Id :'),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.login),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Name :'),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.login),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
