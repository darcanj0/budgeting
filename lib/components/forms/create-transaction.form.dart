import 'dart:math';

import 'package:budgeting/components/buttons/adaptative_button.dart';
import 'package:budgeting/components/forms/adaptative_date_picker.dart';
import 'package:budgeting/components/input/adaptative_text_field.dart';
import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';

class CreateTransactionForm extends StatefulWidget {
  const CreateTransactionForm({super.key, required this.onSubmit});

  final void Function(Transaction) onSubmit;

  @override
  State<CreateTransactionForm> createState() => _CreateTransactionFormState();
}

class _CreateTransactionFormState extends State<CreateTransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  void _submitForm() {
    final Transaction newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: _titleController.text,
        value: double.tryParse(_valueController.text) as double,
        date: _selectedDate ?? DateTime.now());

    if (newTransaction.title.isEmpty || newTransaction.value <= 0) return;
    widget.onSubmit(newTransaction);
  }

  void changeDate(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmit: (value) => _submitForm(),
                label: 'Title',
              ),
              AdaptativeTextField(
                controller: _valueController,
                onSubmit: (value) => _submitForm(),
                label: 'Value (U\$D)',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              AdaptativeDatePicker(
                  selectedDate: _selectedDate, onDateChanged: changeDate),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: AdaptativeButton(
                          text: 'New Transaction', onPressed: _submitForm),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
