import 'package:flutter/material.dart';

class OverflowBarExample extends StatelessWidget {
  const OverflowBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      alignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {}, // Add functionality
          child: const Text('Snap'),
        ),
        ElevatedButton(
          onPressed: () {}, // Add functionality
          child: const Text('Redeem'),
        ),
        ElevatedButton(
          onPressed: () {}, // Add functionality
          child: const Text('Lucky Wheel'),
        ),
      ],
    );
  }
}
