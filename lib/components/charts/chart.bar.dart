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
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Container(
          height: 80,
          width: 10,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Container(
              decoration: barDecoration,
            ),
            FractionallySizedBox(
              heightFactor: total == 0 ? 0 : todaySpent / total,
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                decoration: barDecoration.copyWith(
                    color: Theme.of(context).colorScheme.secondary),
              ),
            )
          ]),
        ),
        FittedBox(
          child: Text(
            todaySpent.toStringAsFixed(2),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12, color: Theme.of(context).colorScheme.background),
          ),
        ),
      ],
    );
  }
}
