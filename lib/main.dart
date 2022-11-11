import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intern_task/authentication/auth_page.dart';
import 'package:intern_task/util/firebase_options.dart';
import 'package:intern_task/authentication/authentication_service.dart';
import 'package:intern_task/screens/launch_screen.dart';
import 'package:intern_task/screens/bookclass_screen.dart';
import 'package:intern_task/screens/course_selection_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      debugShowCheckedModeBanner: false,
      title: 'Learning App',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(),
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            )),
        textTheme: const TextTheme(
          headline1: boldDeepPurpleAccent,
          headline2: boldDeepPurpleAccent,
          headline3: boldDeepPurpleAccent,
          headline4: boldDeepPurpleAccent,
          headline5: boldDeepPurpleAccent,
          headline6: boldDeepPurpleAccent,
          bodyText1: boldDeepPurpleAccent,
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
        iconTheme: const IconThemeData(color: deepPurpleAccent),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 2,
          shadowColor: deepPurpleAccent,
          margin: const EdgeInsets.all(3),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LaunchScreen(),
        '/authenticate': (context) => const Authenticate(),
        '/authpage': (context) => const AuthPage(),
        '/courseselection': (context) => const CourseSelectionScreen(),
        '/bookclass': (context) => const BookClassScreen(),
      },
    );
  }
}
