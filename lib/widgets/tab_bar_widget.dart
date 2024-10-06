import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabItemWidget(label: 'Promotion', isSelected: true),
        TabItemWidget(label: 'Event', isSelected: false),
        TabItemWidget(label: 'Referral', isSelected: false),
      ],
    );
  }
}

class TabItemWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TabItemWidget({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (isSelected)
            Container(height: 2, width: 20, color: Colors.amber),
        ],
      ),
    );
  }
}
