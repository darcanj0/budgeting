import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const AdaptativeButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return Platform.isIOS
        ? CupertinoButton(
            color: colorScheme.primary,
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style:
                  textTheme.bodyMedium!.copyWith(color: colorScheme.background),
            ),
          )
        : MaterialButton(
            onPressed: onPressed,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: colorScheme.primary),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            color: theme.primaryColor,
            child: Text(
              text,
              style:
                  textTheme.bodyMedium!.copyWith(color: colorScheme.background),
            ),
          );
  }
}
