import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTransactionForm extends StatelessWidget {
  const CreateTransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const CupertinoTextField(
                placeholder: 'Título',
              ),
              const CupertinoTextField(
                placeholder: 'Valor (R\$)',
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
                        onPressed: () {},
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
