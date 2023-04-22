import 'package:flutter/material.dart';

class txt extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const txt({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    this.weight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
