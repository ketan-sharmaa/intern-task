import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String buttonName;

  const MenuButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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

List menulist = [
  const MenuButton(buttonName: 'Account Setting'),
  const MenuButton(buttonName: 'Download Options'),
  const MenuButton(buttonName: 'Notifications Setting'),
  const SizedBox(height: 20),
  const MenuButton(buttonName: 'Privacy & Policy'),
  const MenuButton(buttonName: 'Help Center'),
  const MenuButton(buttonName: 'About Us'),
  const SizedBox(height: 10),
];
