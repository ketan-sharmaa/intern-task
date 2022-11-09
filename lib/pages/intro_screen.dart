import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Theme.of(context).iconTheme.color,
                ))),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'intro.png',
                  scale: 5,
                ),
                const SizedBox(height: 20),
                Text(
                  'Online Learning Platform',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor dolore magna aliqua.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, '/login');},
                  child: const Text('Start Learning'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
