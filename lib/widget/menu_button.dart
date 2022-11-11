import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String buttonName;
  final dynamic onPressed;
  const MenuButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonName,
              style: Theme.of(context).textTheme.headline6,
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

//menulist for myaccount screen
List menulist = [
  const MenuButton(
    buttonName: 'Account Setting',
    onPressed: null,
  ),
  const MenuButton(
    buttonName: 'Download Options',
    onPressed: null,
  ),
  const MenuButton(
    buttonName: 'Notifications Setting',
    onPressed: null,
  ),
  const SizedBox(height: 20),
  const MenuButton(
    buttonName: 'Privacy & Policy',
    onPressed: null,
  ),
  const MenuButton(
    buttonName: 'Help Center',
    onPressed: null,
  ),
  const MenuButton(
    buttonName: 'About Us',
    onPressed: null,
  ),
  const SizedBox(height: 10),
];
