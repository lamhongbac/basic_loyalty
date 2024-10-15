import 'package:basic_loyalty/models/navigation_item.dart';
import 'package:basic_loyalty/views/Account/profile.dart';
import 'package:basic_loyalty/views/Home/home.dart';
import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  final List<NavigationItem> _navItems = [
    NavigationItem(icon: const Icon(Icons.home), label: 'Home'),
    NavigationItem(icon: const Icon(Icons.person), label: 'My Account'),
  ];

  // Pages associated with navigation items
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[currentPageIndex]),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          // destinations: const <Widget>[
          //   NavigationDestination(
          //     selectedIcon: Icon(Icons.home),
          //     icon: Icon(Icons.home_outlined),
          //     label: 'Home',
          //   ),
          //   NavigationDestination(
          //     icon: Badge(child: Icon(Icons.notifications_sharp)),
          //     label: 'Notifications',
          //   ),
          //   NavigationDestination(
          //     icon: Badge(
          //       label: Text('2'),
          //       child: Icon(Icons.messenger_sharp),
          //     ),
          //     label: 'Messages',
          //   ),
          // ],
          destinations: _navItems.map((item) => NavigationDestination(icon: item.icon, label: item.label)).toList(),
        ),
    );
  }
}
