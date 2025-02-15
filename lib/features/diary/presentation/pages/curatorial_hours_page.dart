import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/diary/domain/diary_data.dart';
import 'package:ic_app/features/diary/domain/hour_theme.dart';
import 'package:ic_app/features/diary/presentation/widgets/group_button.dart';

class CuratorialHoursPage extends StatelessWidget {
  const CuratorialHoursPage(
      {super.key,
      required this.groupNumber,
      required this.themes,
      required this.diaryData});
  final String groupNumber;
  final HourTheme themes;
  final DiaryData diaryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: theme.colorScheme.primary,
        appBar: AppAppbar(
          appBarText: 'Группа $groupNumber',
          height: 40,
          back: false,
          color: theme.colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Observer(
            builder: (_) => ListView.separated(
              itemCount: themes.hourThemeList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 10,
                thickness: 0,
                indent: 0,
                color: theme.colorScheme.primary,
              ),
              itemBuilder: (BuildContext context, int index) {
                final item = themes.hourThemeList[index];
                return GroupButton(
                  group: item['theme'],
                  colorOfButton: theme.colorScheme.tertiary,
                  onPressed: () {
                    var existingRecord = diaryData.diaryData.firstWhere(
                      (record) =>
                          record['group'] == groupNumber &&
                          record['theme'] == item['theme'],
                      orElse: () => {},
                    );
                    if (existingRecord.isNotEmpty) {
                      context.go('/news');
                    } else {
                      context.push(
                        '/curatorial_diary',
                        extra: [item['theme'], groupNumber],
                      );
                    }
                  },
                );
              },
            ),
          ),
        ));
  }
}
