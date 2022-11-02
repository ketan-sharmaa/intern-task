import 'package:flutter/material.dart';
import 'package:intern_task/pages/menu_button.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('My Account'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp))),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset(
                        'card1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'John Doe',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'John@email.com',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MenuButton(buttonName: 'Account Setting'),
                    const MenuButton(buttonName: 'Download Options'),
                    const MenuButton(buttonName: 'Notifications Setting'),
                    const SizedBox(height: 20),
                    const MenuButton(buttonName: 'Privacy & Policy'),
                    const MenuButton(buttonName: 'Help Center'),
                    const MenuButton(buttonName: 'About Us'),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Log Out')),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
