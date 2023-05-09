import 'package:flutter/cupertino.dart';

import '../components/cards/transaction.card.dart';
import '../components/dashboards/transactions.dashboard.dart';
import '../components/forms/create-transaction.form.dart';
import '../models/transaction.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _transactions = [
    Transaction(id: 'id1', title: 'Tênis', value: 350, date: DateTime.now()),
    Transaction(
        id: 'id2', title: 'Café da manhã', value: 20, date: DateTime.now()),
    Transaction(
        id: 'id3',
        title: 'Mercado da semana',
        value: 250,
        date: DateTime.now()),
    Transaction(
        id: 'id4', title: 'Garrafa de água', value: 15, date: DateTime.now()),
    Transaction(
        id: 'id5',
        title: 'Assinatura do Game Pass',
        value: 30,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Navigation'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TransactionsDashboard(transactions: _transactions),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              ..._transactions.map(
                  (transaction) => TransactionCard(transaction: transaction))
            ]),
            CreateTransactionForm(
              key: key,
            )
          ],
        ),
      ),
    );
  }
}
