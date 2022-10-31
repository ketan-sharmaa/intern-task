import 'package:flutter/material.dart';
import 'package:intern_task/pages/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const deepPurpleAccent = Colors.deepPurpleAccent;
    return MaterialApp(
      title: 'Learning App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        textTheme: const TextTheme(
          headline1:
              TextStyle(color: deepPurpleAccent, fontWeight: FontWeight.bold),
          headline2:
              TextStyle(color: deepPurpleAccent, fontWeight: FontWeight.bold),
          headline3:
              TextStyle(color: deepPurpleAccent, fontWeight: FontWeight.bold),
          headline4:
              TextStyle(color: deepPurpleAccent, fontWeight: FontWeight.bold),
          headline5:
              TextStyle(color: deepPurpleAccent, fontWeight: FontWeight.bold),
          headline6:
              TextStyle(color: deepPurpleAccent, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(color: Color.fromARGB(255, 43, 43, 43)),
        ),
        primaryColor: deepPurpleAccent,
        primarySwatch: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: deepPurpleAccent,
          textStyle: const TextStyle(fontSize: 18),
          shape: const StadiumBorder(),
          minimumSize: const Size(300, 0),
          padding: const EdgeInsets.all(20),
        )),
        buttonTheme: const ButtonThemeData(
          buttonColor: deepPurpleAccent,
          shape: StadiumBorder(),
          minWidth: 500,
        ),
        iconTheme: const IconThemeData(
          color: deepPurpleAccent,
        ),
        fontFamily: 'Switzer',
      ),
      home: const IntroScreen(),
    );
  }
}
