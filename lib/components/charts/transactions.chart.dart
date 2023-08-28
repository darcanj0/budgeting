import 'package:budgeting/components/charts/chart.bar.dart';
import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsChart extends StatelessWidget {
  const TransactionsChart({super.key, required this.recentTransactions});

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        final Transaction transaction = recentTransactions[i];
        final bool isSameDay = transaction.date.day == weekDay.day;
        final bool isSameMonth = transaction.date.month == weekDay.month;
        final bool isSameYear = transaction.date.year == weekDay.year;
        isSameDay && isSameMonth && isSameYear
            ? totalSum += transaction.value
            : totalSum += 0;
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  double get recentTransactionsTotal {
    return groupedTransactions
        .map((e) => e['value'] as double)
        .fold(0, (previousValue, element) => previousValue + element);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupedTransactions.reversed.toList().map((tr) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      label: tr['day'] as String,
                      total: recentTransactionsTotal,
                      todaySpent: tr['value'] as double),
                ))
          ],
        ),
      ),
    );
  }
}
