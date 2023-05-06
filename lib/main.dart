import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  runApp(const BudgetingApp());
}

class BudgetingApp extends StatelessWidget {
  const BudgetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Navigation'),
      ),
      child: const Center(child: Text('Home Page')),
    );
  }
}
