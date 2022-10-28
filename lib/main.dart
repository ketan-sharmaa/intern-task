import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        textTheme: const TextTheme(headline5: TextStyle(color: Colors.purple)),
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.purple),
      ),
      home: const MyHomePage(title: 'flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    const double padding = 50;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Theme.of(context).iconTheme.color,
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'intro.png',
                scale: 5,
              ),
              const SizedBox(height: 20,),
              Text(
                'Online Learning Platform',
                style: Theme.of(context).textTheme.headline5,
              ),              const SizedBox(height: 20,),

              SizedBox(
                width: width / 2,
                child: const Text(
                  '''Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries.''',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),              const SizedBox(height: 20,),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(20)),
                  child: const Text(
                    'Start Learning',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
