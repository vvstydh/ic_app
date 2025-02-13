import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';
import 'package:ic_app/features/profile/presentation/widgets/login_button.dart';
import 'package:ic_app/features/profile/presentation/widgets/login_input_widget.dart';
import 'package:ic_app/features/profile/presentation/widgets/password_input_widget.dart';
import 'package:ic_app/features/profile/presentation/widgets/registration_button.dart';

class AuthentificationPage extends StatelessWidget {
  const AuthentificationPage({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailText = TextEditingController();
    final TextEditingController passwordText = TextEditingController();

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppAppbar(
        appBarText: 'Профиль',
        height: 40,
        back: false,
        color: theme.colorScheme.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/logo.png'),
          ),
          LoginInputWidget(
            hintText: 'Email',
            inputText: emailText,
          ),
          PasswordInputWidget(
            hintText: 'Пароль',
            inputText: passwordText,
          ),
          LoginButton(
            text: 'Войти',
            onPress: () async {
              await userData.signIn(emailText.text, passwordText.text);
              if (userData.user == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Transform.translate(
                    offset: Offset(0, 3),
                    child: Text('Неверный логин или пароль'),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),
          RegistrationButton(
            text: 'Зарегистрироваться',
            onPressed: () {
              context.push('/registration');
            },
          )
        ],
      ),
    );
  }
}
