import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

import '../cards/transaction.card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionList(
      {super.key, required this.transactions, required this.onRemove});
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/empty_cart.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: isLandscape ? constraints.maxHeight * 0.2 : 30,
                    child: Text('No transaction registered!',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black87)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.17,
                    child: Text(
                      'Created transaction will appear here',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 112, 107, 107)),
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final Transaction transaction = transactions[index];
              return TransactionCard(
                transaction: transaction,
                onRemove: onRemove,
              );
            });
  }
}
