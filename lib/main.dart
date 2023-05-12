import 'package:budgeting/pages/home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BudgetingApp());
}

class BudgetingApp extends StatelessWidget {
  const BudgetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
