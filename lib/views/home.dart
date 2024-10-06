import 'package:basic_loyalty/models/promotion_item.dart';
import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';  // Imports header widget
import '../widgets/circle_button_widget.dart';  // Imports circular buttons for navigation
import '../widgets/tab_bar_widget.dart';  // Imports custom tab bar (Promotion, Event, Referral)
import '../widgets/promotion_list_widget.dart';  // Imports promotion list widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final List<PromotionItem> promotions = [
    PromotionItem(title: 'Deal Mãi Kẹo Giảm Đến 50%', brand: 'Gigamall', imageUrl: 'assets/images/promo1.png', subtitle: ''),
    PromotionItem(title: 'Ấm Áp Mùa Thu', brand: 'Uniqlo', imageUrl: 'assets/images/promo2.png', subtitle: ''),
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const HeaderWidget(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleButtonWidget(icon: Icons.camera_alt, label: 'Snap'),
              CircleButtonWidget(icon: Icons.card_giftcard, label: 'Redeem'),
              CircleButtonWidget(icon: Icons.stars, label: 'Lucky Wheel'),
            ],
          ),
          const SizedBox(height: 16),
          const TabBarWidget(),
          Expanded(
            child: PromotionListWidget(promotions: promotions),
          ),
        ],
      ),
      bottomNavigationBar: OverflowBar(
        children: [
          IconButton(icon: const Icon(Icons.home), onPressed: () {}),
          IconButton(icon: const Icon(Icons.car_rental), onPressed: () {}),
          IconButton(icon: const Icon(Icons.store), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
      ),
    );
  }
}
