import 'dart:math';

import 'package:budgeting/components/buttons/adaptative_button.dart';
import 'package:budgeting/components/text/adaptative_text.dart';
import 'package:budgeting/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) => {
              value == null
                  ? {}
                  : {
                      setState(
                        () {
                          _selectedDate = value;
                        },
                      )
                    }
            });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    final TextStyle? bodyMediumTextTheme = textTheme.bodyMedium;
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              AdaptativeText(
                controller: _titleController,
                onSubmit: (value) => _submitForm(),
                label: 'Title',
              ),
              AdaptativeText(
                controller: _valueController,
                onSubmit: (value) => _submitForm(),
                label: 'Value (U\$D)',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : DateFormat('MMM d y')
                              .format(_selectedDate as DateTime),
                      style: bodyMediumTextTheme!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    MaterialButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        'Select Date',
                        style: bodyMediumTextTheme.copyWith(
                            color: colorScheme.primary),
                      ),
                    )
                  ],
                ),
              ),
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
