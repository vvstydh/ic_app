import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/diary/domain/diary_data.dart';
import 'package:ic_app/features/diary/presentation/widgets/diary_input.dart';
import 'package:ic_app/features/diary/presentation/widgets/diary_label.dart';
import 'package:ic_app/features/profile/domain/user_data.dart';

class CuratorialDiary extends StatelessWidget {
  const CuratorialDiary({
    super.key,
    required this.hourThemeGroup,
    required this.userData,
    required this.diaryData,
  });
  final List hourThemeGroup;
  final UserData userData;
  final DiaryData diaryData;

  @override
  Widget build(BuildContext context) {
    DateTime? hourDate;
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
        appBarText: '${hourThemeGroup[0]} ${hourThemeGroup[1]}',
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
            locale: 'en_ISO',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.secondary),
                  onPressed: () async {
                    if (description.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Transform.translate(
                          offset: Offset(0, 3),
                          child: Text('Заполни обязательные поля!'),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    } else if (hourDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Transform.translate(
                          offset: Offset(0, 3),
                          child: Text('Выбери дату!'),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      DiaryData().postDiary(
                          userData.userData,
                          hourThemeGroup[1],
                          hourThemeGroup[0],
                          hourDate.toString(),
                          description.text,
                          feeling.text,
                          behavior.text,
                          plusMinus.text,
                          climate.text,
                          bombing.text);
                      context.go('/diary');
                    }
                  },
                  child: Transform.translate(
                    offset: Offset(0, 3),
                    child: Text(
                      'Заполнить',
                      style: theme.textTheme.bodyMedium,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
