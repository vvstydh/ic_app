import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget(
      {super.key, required this.hintText, required this.inputText});
  final String hintText;
  final TextEditingController inputText;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: theme.colorScheme.secondary, width: 2),
        ),
        child: Transform.translate(
          offset: const Offset(0, 3),
          child: TextField(
            cursorErrorColor: theme.colorScheme.secondary,
            controller: inputText,
            cursorColor: theme.colorScheme.secondary,
            minLines: 1,
            textAlignVertical: TextAlignVertical.bottom,
            style: theme.textTheme.labelMedium,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: theme.textTheme.labelMedium,
            ),
          ),
        ));
  }
}
