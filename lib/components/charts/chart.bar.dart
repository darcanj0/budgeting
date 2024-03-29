import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar(
      {super.key,
      required this.label,
      required this.total,
      required this.todaySpent});

  final String label;
  final double total;
  final double todaySpent;

  final BoxDecoration barDecoration = BoxDecoration(
      color: const Color.fromARGB(255, 214, 198, 198),
      borderRadius: const BorderRadius.all(Radius.elliptical(10, 10)),
      border: Border.all(
          color: const Color.fromARGB(255, 151, 145, 145),
          width: 1,
          style: BorderStyle.solid));

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return LayoutBuilder(
      builder: (ctx, constraints) => Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.15,
            child: Text(
              label,
              style: textTheme.titleLarge!.copyWith(
                  fontSize: textTheme.titleLarge!.fontSize! *
                      MediaQuery.of(context).textScaleFactor),
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.65,
            width: constraints.maxWidth * 0.25,
            margin:
                EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.05),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                decoration: barDecoration,
              ),
              FractionallySizedBox(
                heightFactor: total == 0 ? 0 : todaySpent / total,
                child: Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  decoration:
                      barDecoration.copyWith(color: colorScheme.secondary),
                ),
              )
            ]),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.1,
            child: FittedBox(
              child: Text(
                todaySpent.toStringAsFixed(2),
                style: textTheme.bodyMedium!
                    .copyWith(fontSize: 12, color: colorScheme.background),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
