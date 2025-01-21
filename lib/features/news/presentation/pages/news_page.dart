import 'package:flutter/material.dart';
import 'package:ic_app/app/theme/theme.dart';
import 'package:ic_app/app/widgets/app_appbar.dart';
import 'package:ic_app/features/news/presentation/widgets/latest_news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/previous_news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.primary,
      appBar: const AppAppbar(appBarText: 'Новости', height: 40),
      body: ListView(
        children: [
          const LatestNewsList(),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Text(
              'Предыдущие новости',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Column(
            children: [for (int i = 0; i < 10; i++) PreviousNewsCard()],
          )
        ],
      ),
    );
  }
}
