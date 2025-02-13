import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/big_image_widget.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key, required this.newsList, required this.index});
  final NewsList newsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final item = newsList.newsList[index];

    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.primary,
      appBar: AppAppbar(
        appBarText: 'Новости',
        height: 40,
        back: false,
        color: theme.colorScheme.primary,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        children: [
          BigImageWidget(imageUrl: item['image_url'].toString()),
          Center(
            child: Text(
              item['title'],
              style: theme.textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            item['content'],
            style: theme.textTheme.labelMedium,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
