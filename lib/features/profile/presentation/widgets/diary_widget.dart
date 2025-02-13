import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class DiaryWidget extends StatelessWidget {
  const DiaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(0, 3),
            child: Text(
              'Заполнение дневника',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
