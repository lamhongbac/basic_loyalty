import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.apple, size: 40), // Placeholder for logo
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NGHINHTHU", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Silver · 110 Points", style: TextStyle(color: Colors.grey)),
              ],
            ),
            Icon(Icons.notifications, color: Colors.red),
          ],
        ),
      ],
    );
  }
}
