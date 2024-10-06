import 'package:flutter/material.dart';
import './user_header.dart';
import './user_points.dart';
import './overflow_bar.dart';
import './promotions_grid.dart';
import './bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loyalty"),
        // backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(color: Colors.black),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.notifications),
        //     onPressed: () {},
        //     color: Colors.black,
        //   ),
        // ],
      ),
      body: const Column(
        children: [
          UserHeader(),
          UserPoints(),
          OverflowBarExample(),
          PromotionsGrid(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
