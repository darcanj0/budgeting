import 'dart:math';

import 'package:budgeting/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTransactionForm extends StatelessWidget {
  CreateTransactionForm({super.key, required this.onSubmit});

  final void Function(Transaction) onSubmit;
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  void _submitForm() {
    final Transaction newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: titleController.text,
        value: double.tryParse(valueController.text) as double,
        date: DateTime.now());

    if (newTransaction.title.isEmpty || newTransaction.value <= 0) return;
    onSubmit(newTransaction);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CupertinoTextField(
                placeholder: 'Title',
                controller: titleController,
                onSubmitted: (value) => _submitForm(),
              ),
              CupertinoTextField(
                placeholder: 'Value (U\$D)',
                controller: valueController,
                onSubmitted: (value) => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: CupertinoButton(
                        onPressed: () => _submitForm(),
                        color: Colors.green,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'New Transaction',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
