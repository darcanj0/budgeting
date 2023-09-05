import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

import '../../components/charts/transactions.chart.dart';
import '../../components/lists/transaction.list.dart';

class HomePageBody extends StatefulWidget {
  final bool isLandscape;
  final bool showChart;
  final double chartMarginInPx;
  final double avaliableHeight;
  final List<Transaction> recentTransactions;
  final List<Transaction> transactions;

  const HomePageBody({
    required this.isLandscape,
    required this.showChart,
    required this.chartMarginInPx,
    required this.avaliableHeight,
    required this.recentTransactions,
    required this.transactions,
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  void _removeTransaction(String id) {
    setState(() {
      widget.transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.showChart || !widget.isLandscape)
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: widget.chartMarginInPx),
                  height: widget.avaliableHeight *
                      (widget.isLandscape ? 0.85 : 0.3),
                  child: TransactionsChart(
                      recentTransactions: widget.recentTransactions),
                ),
              if (!widget.showChart || !widget.isLandscape)
                SizedBox(
                  height:
                      widget.avaliableHeight * (widget.isLandscape ? 1 : 0.7),
                  child: TransactionList(
                      transactions: widget.transactions,
                      onRemove: _removeTransaction),
                )
            ],
          ),
        ),
      ),
    );
  }
}
