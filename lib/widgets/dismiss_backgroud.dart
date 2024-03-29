import 'package:flutter/material.dart';

class DismissBackground extends StatelessWidget {
  const DismissBackground({super.key, required this.mainAxisAlignment});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: const [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.delete))
          ],
        ));
  }
}
