import 'package:flutter/material.dart';
import 'package:intern_task/util/widget/label_checkbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('LOG IN'),
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_sharp))),
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Learning App',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 40),
                Text(
                  'Enter your log in details to access your account',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.face_unlock_outlined),
                          label: const FittedBox(child: Text('Facebook')),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 48, 5, 239),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.face_unlock_outlined),
                          label: const FittedBox(child: Text('Google')),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LabelCheckBox(checkboxLabel: 'Remember me?'),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/courseselection');
                  },
                  child: const Text('Log In with your account'),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
