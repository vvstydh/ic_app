import 'package:flutter/material.dart';
import 'package:ic_app/app/theme/theme.dart';

class PreviousNewsCard extends StatelessWidget {
  const PreviousNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 150,
        decoration: BoxDecoration(
            color: theme.colorScheme.tertiary,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
