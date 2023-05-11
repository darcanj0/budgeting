import 'package:flutter/material.dart';

class TransactionsDashboard extends StatelessWidget {
  const TransactionsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: const Card(
        color: Colors.green,
        elevation: 5,
        child: Center(child: Text('Dashboard')),
      ),
    );
  }
}
