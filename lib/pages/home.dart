import 'package:budgeting/components/forms/create-transaction.form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/dashboards/transactions.dashboard.dart';
import '../components/lists/transaction.list.dart';
import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
        date: DateTime.now()),
  ];

  void _addTransaction(Transaction newTransaction) {
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _openCreateTransactionFormModal(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: SizedBox(
                height: 500,
                child: CreateTransactionForm(onSubmit: _addTransaction)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions'), actions: [
        IconButton(
            onPressed: () => _openCreateTransactionFormModal(context),
            icon: const Icon(Icons.add))
      ]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TransactionsDashboard(),
              Column(children: [
                TransactionList(transactions: _transactions),
              ])
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _openCreateTransactionFormModal(context)),
    );
  }
}
