import 'package:budgeting/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(const BudgetingApp());
}

class BudgetingApp extends StatelessWidget {
  const BudgetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.heeboTextTheme().copyWith(
          bodyMedium: const TextStyle(fontWeight: FontWeight.bold),
          titleLarge: const TextStyle(color: Colors.white)
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.greenAccent.shade700,
        )
      ),
    );
  }
}
