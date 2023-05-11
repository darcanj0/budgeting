import 'package:budgeting/components/users/transaction.user.dart';
import 'package:flutter/cupertino.dart';

import '../components/dashboards/transactions.dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Navigation'),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [TransactionsDashboard(), TransactionUser()],
          ),
        ),
      ),
    );
  }
}
