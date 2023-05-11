import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

import '../cards/transaction.card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({super.key, required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ...transactions
          .map((transaction) => TransactionCard(transaction: transaction))
    ]);
  }
}
