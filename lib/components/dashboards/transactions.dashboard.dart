import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsDashboard extends StatelessWidget {
  const TransactionsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 120, bottom: 60),
      child: const Card(
        color: CupertinoColors.activeBlue,
        elevation: 5,
        child: Center(child: Text('Dashboard')),
      ),
    );
  }
}
