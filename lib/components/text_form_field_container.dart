import 'package:flutter/material.dart';

class TextFormFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFormFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}