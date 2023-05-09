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
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  transaction.date.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Text(
                                'R\$ ${transaction.value.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.red),
                              )),
                        ]),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
