import 'package:flutter/material.dart';
import 'package:intern_task/authentication/authentication_service.dart';
import 'package:intern_task/widget/label_checkbox.dart';

class CreateAccountScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const CreateAccountScreen({super.key, required this.showLoginScreen});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();

  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('SIGN UP'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Create new account',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 40),
            Text(
              'Enter your details',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  TextFormField(
                    controller: _fullNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Full Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Full Name'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: _hidePassword,
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
                                  _hidePassword = !_hidePassword;
                                }),
                            icon: Icon(
                              _hidePassword
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility,
                            )),
                        labelText: 'Password'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: _hideConfirmPassword,
                    controller: _confirmPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => setState(() {
                                  _hideConfirmPassword = !_hideConfirmPassword;
                                }),
                            icon: Icon(
                              _hideConfirmPassword
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility,
                            )),
                        labelText: 'Confirm Password'),
                  ),
                  const SizedBox(height: 10),
                  const LabelCheckBox(checkboxLabel: 'Remember me'),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          _passwordController.text ==
                              _confirmPasswordController.text) {
                        await Authentication().signUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text);
                        await Authentication().addUserDetails(
                          _fullNameController.text.trim(),
                          _emailController.text.trim(),
                        );
                        
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ]),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextButton(
                    onPressed: widget.showLoginScreen,
                    child: Text(
                      'Log in',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.blue),
                    ))
              ],
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
