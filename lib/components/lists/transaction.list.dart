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
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/empty_cart.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text('No transaction registered!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black87)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Created transaction will appear here',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final Transaction transaction = transactions[index];
                return TransactionCard(transaction: transaction);
              }),
    );
  }
}
