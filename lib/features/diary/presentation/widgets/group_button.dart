import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class GroupButton extends StatelessWidget {
  const GroupButton(
      {super.key,
      required this.group,
      this.onPressed,
      required this.colorOfButton});
  final String group;
  final VoidCallback? onPressed;
  final Color colorOfButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 125,
          decoration: BoxDecoration(
              color: colorOfButton,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                )
              ]),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Transform.translate(
                offset: Offset(0, 3),
                child: Text(
                  group,
                  style: theme.textTheme.bodyLarge,
                )),
          )),
    );
  }
}
