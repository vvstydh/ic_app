import 'package:flutter/material.dart';
import 'package:ic_app/app/theme/theme.dart';

class LatestNewCard extends StatelessWidget {
  const LatestNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 300,
        decoration: BoxDecoration(
            color: theme.colorScheme.tertiary,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
