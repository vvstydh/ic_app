import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

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
        body:
            // ListView.separated(
            //   separatorBuilder: Separete,
            //   itemCount: 2,
            //   itemBuilder: (context, builder) {},
            // ),
            Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 10,
              thickness: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 125,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 103, 136, 153),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                    child: Text(
                  'Группа 744-${index + 1}',
                  style: theme.textTheme.bodyLarge,
                )),
              );
            },
          ),
        ));
  }
}
