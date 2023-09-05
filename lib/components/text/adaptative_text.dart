import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeText extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSubmit;
  final TextInputType keyboardType;
  final String label;

  const AdaptativeText(
      {required this.controller,
      required this.onSubmit,
      required this.label,
      this.keyboardType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmit,
              keyboardType: keyboardType,
              placeholder: label,
            ),
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            controller: controller,
            onSubmitted: onSubmit,
            keyboardType: keyboardType,
          );
  }
}
