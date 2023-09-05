import 'dart:io';

import 'package:budgeting/components/forms/create-transaction.form.dart';
import 'package:budgeting/pages/home/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/transaction.dart';

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
    bool isIos = Platform.isIOS;

    Widget _getIconButton(IconData icon, Function() fn) {
      return isIos
          ? GestureDetector(onTap: fn, child: Icon(icon))
          : IconButton(onPressed: fn, icon: Icon(icon, color: iconTheme.color));
    }

    final List<Widget> actions = [
      if (isLandscape)
        _getIconButton(
          showChart
              ? (isIos ? CupertinoIcons.list_bullet : Icons.list)
              : (isIos ? CupertinoIcons.chart_bar : Icons.bar_chart),
          () => setState(() {
            showChart = !showChart;
          }),
        ),
      _getIconButton(
        isIos ? CupertinoIcons.add : Icons.add,
        () => _openCreateTransactionFormModal(context),
      )
    ];

    final dynamic appBar = isIos
        ? CupertinoNavigationBar(
            middle: Text('Transactions', style: textTheme.headlineSmall),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: actions),
          )
        : AppBar(
            title: Text('Transactions', style: textTheme.headlineSmall),
            backgroundColor: theme.primaryColor,
            actions: actions,
          );
    const double chartMarginInPx = 15;
    final double avaliableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top -
        (chartMarginInPx * 2);

    return isIos
        ? CupertinoPageScaffold(
            child: HomePageBody(
            avaliableHeight: avaliableHeight,
            chartMarginInPx: chartMarginInPx,
            isLandscape: isLandscape,
            showChart: showChart,
            recentTransactions: _recentTransactions,
            transactions: _transactions,
          ))
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar,
            body: HomePageBody(
              avaliableHeight: avaliableHeight,
              chartMarginInPx: chartMarginInPx,
              isLandscape: isLandscape,
              showChart: showChart,
              recentTransactions: _recentTransactions,
              transactions: _transactions,
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: colorScheme.primary,
                child: const Icon(Icons.add),
                onPressed: () => _openCreateTransactionFormModal(context)),
          );
  }
}
