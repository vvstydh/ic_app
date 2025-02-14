import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class DiaryInput extends StatelessWidget {
  const DiaryInput({super.key, required this.hint, required this.controller});
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: controller,
        cursorErrorColor: theme.colorScheme.secondary,
        cursorColor: theme.colorScheme.secondary,
        textAlignVertical: TextAlignVertical.bottom,
        style: theme.textTheme.labelMedium,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hint,
          hintStyle: theme.textTheme.displayMedium,
        ),
      ),
    );
  }
}
