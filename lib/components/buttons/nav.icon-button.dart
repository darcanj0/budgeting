import 'package:flutter/cupertino.dart';

class NavIconButton extends StatelessWidget {
  const NavIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.add_circled_solid,
          )),
    );
  }
}
