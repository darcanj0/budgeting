import 'dart:math';

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
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (value) => _submitForm(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Value (U\$D)'),
                controller: _valueController,
                onSubmitted: (value) => _submitForm(),
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
                      child: MaterialButton(
                        onPressed: () => _submitForm(),
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: colorScheme.primary),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6))),
                        color: theme.primaryColor,
                        child: Text(
                          'New Transaction',
                          style: textTheme.bodyMedium!
                              .copyWith(color: colorScheme.background),
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
