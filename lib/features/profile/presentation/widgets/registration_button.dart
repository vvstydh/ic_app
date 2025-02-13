import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onPressed,
        child: Transform.translate(
          offset: Offset(0, 3),
          child: Text(
            text,
            style: theme.textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
