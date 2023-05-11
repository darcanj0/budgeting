import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

import '../forms/create-transaction.form.dart';
import '../lists/transaction.list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<StatefulWidget> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final List<Transaction> _transactions = [
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
    return Column(children: [
      TransactionList(transactions: _transactions),
      CreateTransactionForm()
    ]);
  }
}
