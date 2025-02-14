import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/diary/presentation/widgets/diary_input.dart';
import 'package:ic_app/features/diary/presentation/widgets/diary_label.dart';

class CuratorialDiary extends StatelessWidget {
  const CuratorialDiary({
    super.key,
    required this.hourThemeGroup,
  });
  final String hourThemeGroup;

  @override
  Widget build(BuildContext context) {
    DateTime hourDate;
    final TextEditingController curatorialTheme = TextEditingController();
    final TextEditingController description = TextEditingController();
    final TextEditingController feeling = TextEditingController();
    final TextEditingController behavior = TextEditingController();
    final TextEditingController plusMinus = TextEditingController();
    final TextEditingController climate = TextEditingController();
    final TextEditingController bombing = TextEditingController();
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.primary,
      appBar: AppAppbar(
        appBarText: hourThemeGroup,
        height: 40,
        back: false,
        color: theme.colorScheme.primary,
      ),
      body: ListView(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 5, 1, 1),
            lastDate: DateTime(DateTime.now().year + 5, 12, 31),
            onDateSelected: (date) {
              hourDate = date;
            },
            leftMargin: 10,
            monthColor: theme.colorScheme.secondary,
            dayColor: theme.colorScheme.secondary,
            activeDayColor: theme.colorScheme.primary,
            activeBackgroundDayColor: const Color.fromARGB(255, 103, 136, 153),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          const DiaryLabel(label: 'Тема кураторского часа'),
          DiaryInput(
            hint: 'Тема (обязательно)',
            controller: curatorialTheme,
          ),
          const DiaryLabel(label: 'Описание кч/план + упражнение'),
          DiaryInput(
            hint: 'Описание (обязательно)',
            controller: description,
          ),
          const DiaryLabel(label: 'Ощущение после кч'),
          DiaryInput(
            hint: 'Ощущение после КЧ',
            controller: feeling,
          ),
          const DiaryLabel(
              label:
                  'Первокурсники (поведение на КЧ, проблемные/интересные моменты и др.)'),
          DiaryInput(
            hint: 'Поведение на КЧ',
            controller: behavior,
          ),
          const DiaryLabel(
              label:
                  'Плюсы и минусы проведенного кч. Что хочешь изменить/добавить в следующем?'),
          DiaryInput(
            hint: 'Плюсы и минусы',
            controller: plusMinus,
          ),
          const DiaryLabel(label: 'Климат в группе'),
          DiaryInput(
            hint: 'Климат',
            controller: climate,
          ),
          const DiaryLabel(label: 'Побомбить (высказаться)'),
          DiaryInput(
            hint: 'Бомбим',
            controller: bombing,
          ),
        ],
      ),
    );
  }
}
