import 'package:flutter/material.dart';

class UserPoints extends StatelessWidget {
  const UserPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,  // Fixed height for wireframe
      color: Colors.grey[200], // Placeholder color
      child: const Center(child: Text("User Points")), // Placeholder text
    );
  }
}
