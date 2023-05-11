import 'dart:math';

import 'package:budgeting/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTransactionForm extends StatelessWidget {
  CreateTransactionForm({super.key, required this.onSubmit});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(Transaction) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CupertinoTextField(
                placeholder: 'Título',
                controller: titleController,
              ),
              CupertinoTextField(
                placeholder: 'Valor (R\$)',
                controller: valueController,
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
                        onPressed: () {
                          final Transaction newTransaction = Transaction(
                              id: Random().nextDouble().toString(),
                              title: titleController.text,
                              value: double.parse(valueController.text),
                              date: DateTime.now());
                          onSubmit(newTransaction);
                        },
                        color: Colors.green,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Nova Transação',
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
