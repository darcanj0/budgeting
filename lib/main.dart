import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main(List<String> args) {
  runApp(const BudgetingApp());
}

class BudgetingApp extends StatelessWidget {
  const BudgetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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

  HomePage({super.key});

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
            const SizedBox(
              child: Card(
                color: Colors.green,
                elevation: 5,
                child: Center(child: Text('Dashboard')),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              ..._transactions.map((transaction) => Card(
                    elevation: 5,
                    shape: const ContinuousRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(transaction.value.toString()),
                          Column(
                            children: [
                              Text(transaction.title),
                              Text(transaction.date.toLocal().toString())
                            ],
                          )
                        ]),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
