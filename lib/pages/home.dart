import 'package:budgeting/components/forms/create-transaction.form.dart';
import 'package:flutter/material.dart';

import '../components/charts/transactions.chart.dart';
import '../components/lists/transaction.list.dart';
import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //     id: '0',
    //     title: 'old',
    //     value: 300,
    //     date: DateTime.now().subtract(const Duration(days: 33))),
    // Transaction(
    //     id: '1',
    //     title: 'title',
    //     value: 100,
    //     date: DateTime.now().subtract(const Duration(days: 3))),
    // Transaction(
    //     id: '2',
    //     title: 'other',
    //     value: 150,
    //     date: DateTime.now().subtract(const Duration(days: 4)))
  ];

  List<Transaction> get _recentTransactions {
    const Duration oneWeek = Duration(days: 7);
    return _transactions
        .where(
            (element) => element.date.isAfter(DateTime.now().subtract(oneWeek)))
        .toList();
  }

  void _addTransaction(Transaction newTransaction) {
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  void _openCreateTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
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
    final AppBar appBar = AppBar(
        title: Text('Transactions',
            style: Theme.of(context).textTheme.headlineSmall),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () => _openCreateTransactionFormModal(context),
            icon: Icon(
              Icons.add,
              color: IconTheme.of(context).color,
            ),
          )
        ]);
    const double chartMarginInPx = 15;
    final double avaliableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        (chartMarginInPx * 2);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: chartMarginInPx),
                height: avaliableHeight * 0.3,
                child:
                    TransactionsChart(recentTransactions: _recentTransactions),
              ),
              SizedBox(
                height: avaliableHeight * 0.7,
                child: TransactionList(
                    transactions: _transactions, onRemove: _removeTransaction),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.add),
          onPressed: () => _openCreateTransactionFormModal(context)),
    );
  }
}
