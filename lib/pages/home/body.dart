import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

import '../../components/charts/transactions.chart.dart';
import '../../components/lists/transaction.list.dart';

class HomePageBody extends StatelessWidget {
  final bool isLandscape;
  final bool showChart;
  final double chartMarginInPx;
  final double avaliableHeight;
  final List<Transaction> recentTransactions;
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const HomePageBody({
    required this.isLandscape,
    required this.showChart,
    required this.chartMarginInPx,
    required this.avaliableHeight,
    required this.recentTransactions,
    required this.transactions,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showChart || !isLandscape)
              Container(
                margin: EdgeInsets.symmetric(vertical: chartMarginInPx),
                height: avaliableHeight * (isLandscape ? 0.85 : 0.3),
                child:
                    TransactionsChart(recentTransactions: recentTransactions),
              ),
            if (!showChart || !isLandscape)
              SizedBox(
                height: avaliableHeight * (isLandscape ? 1 : 0.7),
                child: TransactionList(
                    transactions: transactions, onRemove: onRemove),
              )
          ],
        ),
      ),
    );
  }
}
