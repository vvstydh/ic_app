import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/diary/domain/diary_data.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';
import 'package:ic_app/features/profile/presentation/widgets/diary_widget.dart';
import 'package:ic_app/features/profile/presentation/widgets/registration_button.dart';
import 'package:ic_app/features/profile/presentation/widgets/user_information_widget.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.userData});
  final UserData userData;

  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: AppAppbar(
          appBarText: 'Профиль',
          height: 40,
          back: false,
          color: theme.colorScheme.primary,
        ),
        body: SwipeRefresh.adaptive(
            stateStream: _stream,
            onRefresh: () async {
              await userData.getUserData();
              _controller.sink.add(SwipeRefreshState.hidden);
            },
            indicatorColor: theme.colorScheme.secondary,
            padding: const EdgeInsets.only(top: 10, bottom: 120),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: InkWell(
                        highlightColor: theme.colorScheme.primary,
                        focusColor: theme.colorScheme.primary,
                        splashColor: theme.colorScheme.primary,
                        hoverColor: theme.colorScheme.primary,
                        onTap: () {
                          userData.uploadAvatar();
                        },
                        child: Observer(
                          builder: (_) => CircleAvatar(
                            radius: 50,
                            backgroundColor: theme.colorScheme.tertiary,
                            backgroundImage:
                                userData.userData?['avatar_url'] != null
                                    ? Image.network(
                                            userData.userData?['avatar_url'])
                                        .image
                                    : null,
                            child: userData.userData?['avatar_url'] == null
                                ? Icon(
                                    Icons.person,
                                    size: 50,
                                    color: theme.colorScheme.secondary,
                                  )
                                : null,
                          ),
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Transform.translate(
                          offset: const Offset(0, 3),
                          child: Observer(
                            builder: (_) => Text(
                              '${userData.userData?['name']} ${userData.userData?['surname']}',
                              style: theme.textTheme.bodyLarge,
                            ),
                          ))),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Transform.translate(
                          offset: const Offset(0, 3),
                          child: Observer(
                            builder: (_) => Text(
                              '${userData.user?.email}',
                              style: theme.textTheme.labelLarge,
                            ),
                          ))),
                  Observer(
                    builder: (_) => UserInformationWidget(
                      text: 'Должность: ${userData.userData?['position']}',
                      needChanges: false,
                    ),
                  ),
                  Observer(
                    builder: (_) => UserInformationWidget(
                      text: 'Факультет: ${userData.userData?['faculty']}',
                      needChanges: false,
                    ),
                  ),
                  Observer(
                    builder: (_) => UserInformationWidget(
                      text:
                          'Курируемые группы: ${userData.userData?['groups']}',
                      needChanges: false,
                    ),
                  ),
                  const DiaryWidget(),
                  RegistrationButton(
                    text: 'Выйти из аккаунта',
                    onPressed: () {
                      userData.signOut();
                      context.go('/authentication');
                    },
                  ),
                ],
              )
            ]));
  }
}
