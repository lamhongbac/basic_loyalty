import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "GigaMall"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Book Grab"),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store Directory"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "My Account"),
      ],
    );
  }
}
