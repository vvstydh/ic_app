import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget(
      {Key? key, required this.inputText, required this.hintText})
      : super(key: key);
  final String hintText;
  final TextEditingController inputText;

  @override
  Widget build(BuildContext context) {
    final UserData passwordVisibility = UserData();
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: theme.colorScheme.secondary, width: 2),
      ),
      child: Center(
          child: Observer(
              builder: (_) => Transform.translate(
                  offset: const Offset(0, 3),
                  child: TextField(
                    controller: inputText,
                    cursorColor: theme.colorScheme.secondary,
                    minLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    style: theme.textTheme.labelMedium,
                    obscureText: passwordVisibility.passwordVisibility,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: hintText,
                      hintStyle: theme.textTheme.labelMedium,
                      suffixIcon: Transform.translate(
                          offset: const Offset(0, -5),
                          child: IconButton(
                              color: theme.colorScheme.secondary,
                              iconSize: 25,
                              onPressed: () {
                                passwordVisibility.changePasswordVisibility();
                              },
                              icon: Icon(passwordVisibility.passwordVisibility
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye))),
                    ),
                  )))),
    );
  }
}
