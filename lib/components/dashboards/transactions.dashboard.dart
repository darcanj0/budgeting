import 'package:flutter/material.dart';

class TransactionsDashboard extends StatelessWidget {
  const TransactionsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        child: Center(child: Text('Dashboard', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold))),
      ),
    );
  }
}
