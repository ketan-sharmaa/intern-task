import 'package:flutter/material.dart';
import 'package:intern_task/screens/fogotpassword_screen.dart';
import 'package:intern_task/authentication/authentication_service.dart';
import 'package:intern_task/widget/label_checkbox.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showCreateAccountPage;
  const LoginScreen({super.key, required this.showCreateAccountPage});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showpassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LOG IN'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 40),
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
                Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: _showpassword,
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => setState(() {
                                  _showpassword = !_showpassword;
                                }),
                            icon: Icon(
                              _showpassword
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LabelCheckBox(checkboxLabel: 'Remember me'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ForgotPasswordScreen();
                              }));
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: Colors.red.shade400,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Authentication().logIn(
                              email: _emailController.text.trim(),
                              password: _passwordController.text);
                        }
                      },
                      child: const Text('Log in'),
                    ),
                  ]),
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
                        onPressed: widget.showCreateAccountPage,
                        child: Text(
                          'Create Account',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.blue),
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
