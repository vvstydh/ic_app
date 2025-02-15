import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/diary/domain/diary_data.dart';
import 'package:ic_app/features/diary/domain/hour_theme.dart';
import 'package:ic_app/features/diary/presentation/widgets/group_button.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage(
      {super.key,
      required this.userData,
      required this.diaryData,
      required this.themes});
  final UserData userData;
  final DiaryData diaryData;
  final HourTheme themes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: theme.colorScheme.primary,
        appBar: AppAppbar(
          appBarText: 'Дневник',
          height: 40,
          back: false,
          color: theme.colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.separated(
            itemCount: userData.groups.length,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 10,
              thickness: 0,
              color: theme.colorScheme.primary,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GroupButton(
                group: 'Группа ${userData.groups[index]}',
                colorOfButton: Color.fromARGB(255, 103, 136, 153),
                onPressed: () {
                  themes.getThemeList();

                  diaryData.getDiary(userData.user!.id);

                  context.push('/curatorial_hours_page',
                      extra: userData.groups[index]);
                },
              );
            },
          ),
        ));
  }
}
