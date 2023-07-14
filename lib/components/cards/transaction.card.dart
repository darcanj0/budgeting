import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  const TransactionCard(
      {super.key, required this.transaction, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
      color: Theme.of(context).colorScheme.background,
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text('U\$ ${transaction.value.toStringAsFixed(2)}'),
              ),
            )),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat('MMM d y').format(transaction.date)),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
          ),
          onPressed: () => onRemove(transaction.id),
        ),
      ),
    );
  }
}
