import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

import '../cards/transaction.card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({super.key, required this.transactions});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final Transaction transaction = transactions[index];
            return TransactionCard(transaction: transaction);
          }),
    );
  }
}
