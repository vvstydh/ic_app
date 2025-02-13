import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text, this.onPress});
  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary),
          onPressed: onPress,
          child: Transform.translate(
            offset: Offset(0, 3),
            child: Text(
              text,
              style: theme.textTheme.bodyMedium,
            ),
          )),
    );
  }
}
