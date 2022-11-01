import 'package:flutter/material.dart';
import 'package:intern_task/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const deepPurpleAccent = Colors.deepPurpleAccent;
    const boldDeepPurpleAccent = TextStyle(
      color: deepPurpleAccent,
      fontWeight: FontWeight.bold,
    );
    return MaterialApp(
      title: 'Learning App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              iconTheme: IconThemeData(),
              centerTitle: true,
              titleTextStyle: boldDeepPurpleAccent),
          textTheme: const TextTheme(
            headline1: boldDeepPurpleAccent,
            headline2: boldDeepPurpleAccent,
            headline3: boldDeepPurpleAccent,
            headline4: boldDeepPurpleAccent,
            headline5: boldDeepPurpleAccent,
            headline6: boldDeepPurpleAccent,
            bodyText2: TextStyle(color: Color.fromARGB(255, 43, 43, 43)),
            bodyText1: boldDeepPurpleAccent,
            
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
          iconTheme: const IconThemeData(color: deepPurpleAccent),
          fontFamily: 'Switzer',
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
          ),
      home: const LoginScreen(),
    );
  }
}
