import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';
import 'package:ic_app/features/profile/presentation/widgets/list_of_courses.dart';
import 'package:ic_app/features/profile/presentation/widgets/login_button.dart';
import 'package:ic_app/features/profile/presentation/widgets/login_input_widget.dart';
import 'package:ic_app/features/profile/presentation/widgets/password_input_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailText = TextEditingController();
    final TextEditingController nameText = TextEditingController();
    final TextEditingController surnameText = TextEditingController();
    final TextEditingController passwordText = TextEditingController();

    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: AppAppbar(
          appBarText: 'Профиль',
          height: 40,
          back: false,
          color: theme.colorScheme.primary,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
                LoginInputWidget(
                  hintText: 'Email',
                  inputText: emailText,
                ),
                LoginInputWidget(
                  hintText: 'Имя',
                  inputText: nameText,
                ),
                LoginInputWidget(
                  hintText: 'Фамилия',
                  inputText: surnameText,
                ),
                ListOfCourses(
                  userData: userData,
                ),
                PasswordInputWidget(
                  hintText: 'Пароль',
                  inputText: passwordText,
                ),
                LoginButton(
                  text: 'Зарегистрироваться',
                  onPress: () {
                    userData.signUp(emailText.text, passwordText.text,
                        nameText.text, surnameText.text);
                    context.go('/profile');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
