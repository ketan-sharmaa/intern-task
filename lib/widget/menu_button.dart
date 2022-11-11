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
  MenuButton(
    buttonName: 'Account Setting',
    onPressed: () {},
  ),
  MenuButton(
    buttonName: 'Download Options',
    onPressed: () {},
  ),
  MenuButton(
    buttonName: 'Notifications Setting',
    onPressed: () {},
  ),
  const SizedBox(height: 20),
  MenuButton(
    buttonName: 'Privacy & Policy',
    onPressed: () {},
  ),
  MenuButton(
    buttonName: 'Help Center',
    onPressed: () {},
  ),
  MenuButton(
    buttonName: 'About Us',
    onPressed: () {},
  ),
  const SizedBox(height: 10),
];
