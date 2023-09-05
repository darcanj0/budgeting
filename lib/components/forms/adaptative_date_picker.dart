import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(DateTime) onDateChanged;
  final DateTime now = DateTime.now();

  AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    final TextStyle? bodyMediumTextTheme = textTheme.bodyMedium;

    void renderDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime.now())
          .then((value) => {
                value == null ? {} : {onDateChanged(value)}
              });
    }

    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              onDateTimeChanged: onDateChanged,
              mode: CupertinoDatePickerMode.date,
            ))
        : SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? 'No date selected'
                      : DateFormat('MMM d y').format(selectedDate as DateTime),
                  style: bodyMediumTextTheme!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                MaterialButton(
                  onPressed: renderDatePicker,
                  child: Text(
                    'Select Date',
                    style: bodyMediumTextTheme.copyWith(
                        color: colorScheme.primary),
                  ),
                )
              ],
            ),
          );
  }
}
