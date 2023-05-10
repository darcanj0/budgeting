import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTransactionForm extends StatelessWidget {
  CreateTransactionForm({super.key});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

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
                          print(
                              "${titleController.text}, ${valueController.text}");
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
