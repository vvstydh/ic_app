import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          context.push('/registration');
        },
        child: Transform.translate(
          offset: Offset(0, 3),
          child: Text(
            'Зарегистрироваться',
            style: theme.textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
