import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsDashboard extends StatelessWidget {
  late final List<Transaction> _transactions;
  TransactionsDashboard({super.key, required List<Transaction> transactions}) {
    _transactions = transactions;
  }

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
