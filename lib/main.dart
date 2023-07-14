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
            bodyMedium: const TextStyle(fontWeight: FontWeight.w500),
            titleLarge:
                const TextStyle(color: Color.fromARGB(242, 238, 236, 241)),
            titleMedium: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 20),
            headlineSmall: const TextStyle(
              color: Color.fromARGB(242, 238, 236, 241),
            ),
          ),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(242, 238, 236, 241)),
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.purple,
                secondary: const Color.fromARGB(255, 55, 180, 59),
                background: const Color.fromARGB(242, 238, 236, 241),
                error: const Color.fromARGB(255, 226, 82, 72),
              ),
          useMaterial3: true),
    );
  }
}
