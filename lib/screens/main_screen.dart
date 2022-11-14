import 'package:flutter/material.dart';
import 'package:intern_task/screens/home_screen.dart';
import 'package:intern_task/screens/myaccount_screen.dart';
import 'package:intern_task/screens/myclasses_screen.dart';

class BottomNavPageView extends StatefulWidget {
  const BottomNavPageView({super.key});

  @override
  State<BottomNavPageView> createState() => _BottomNavPageViewState();
}

class _BottomNavPageViewState extends State<BottomNavPageView> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          },
          children: const [
            HomeScreen(),
            MyClassesScreen(),
            MyAccountScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'My Classes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (index) {
              setState(() => _selectedIndex = index);
              _pageController.jumpToPage(index);
            }),
      ),
    );
  }
}
