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

  bool showChart = false;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final IconThemeData iconTheme = IconTheme.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final AppBar appBar = AppBar(
        title: Text('Transactions', style: textTheme.headlineSmall),
        backgroundColor: theme.primaryColor,
        actions: [
          if (isLandscape)
            IconButton(
              onPressed: () => setState(() {
                showChart = !showChart;
              }),
              icon: Icon(
                showChart ? Icons.list : Icons.bar_chart,
                color: iconTheme.color,
              ),
            ),
          IconButton(
            onPressed: () => _openCreateTransactionFormModal(context),
            icon: Icon(
              Icons.add,
              color: iconTheme.color,
            ),
          )
        ]);
    const double chartMarginInPx = 15;
    final double avaliableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top -
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
              if (showChart || !isLandscape)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: chartMarginInPx),
                  height: avaliableHeight * (isLandscape ? 0.85 : 0.3),
                  child: TransactionsChart(
                      recentTransactions: _recentTransactions),
                ),
              if (!showChart || !isLandscape)
                SizedBox(
                  height: avaliableHeight * (isLandscape ? 1 : 0.7),
                  child: TransactionList(
                      transactions: _transactions,
                      onRemove: _removeTransaction),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: colorScheme.primary,
          child: const Icon(Icons.add),
          onPressed: () => _openCreateTransactionFormModal(context)),
    );
  }
}
