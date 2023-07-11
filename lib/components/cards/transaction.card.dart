import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  late final Transaction _transaction;

  TransactionCard({super.key, required Transaction transaction}) {
    _transaction = transaction;
  }

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
                child: Text('U\$ ${_transaction.value.toStringAsFixed(2)}'),
              ),
            )),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat('d MMM y').format(_transaction.date)),
      ),
    );
  }
}
