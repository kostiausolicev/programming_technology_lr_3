import 'package:flutter/material.dart';
import 'package:practic/thyme_widget.dart';

import 'calculate_widget.dart';

void main() {
  runApp(CalculatorApp());
}

// Основной виджет приложения Flutter.
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Счёты)', // Заголовок приложения.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Основной цвет приложения.
      ),
      home: ThymeWidget(), // Основной экран калькулятора.
    );
  }
}
