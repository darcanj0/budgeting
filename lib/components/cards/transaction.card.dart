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
      elevation: 5,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _transaction.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    DateFormat('d/MMM/y').format(_transaction.date),
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  'U\$ ${_transaction.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red),
                )),
          ]),
    );
  }
}
