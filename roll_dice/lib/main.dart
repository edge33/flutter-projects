import 'package:flutter/material.dart';

import 'package:roll_dice/gradient_container.dart';

const List<Color> gradientColors = [Colors.red, Colors.green];

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(gradientColors),
      ),
    ),
  );
}
