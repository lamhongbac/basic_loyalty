import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,  // Fixed height for wireframe
      color: Colors.grey[300], // Placeholder color
      child: const Center(child: Text("User Header")), // Placeholder text
    );
  }
}
