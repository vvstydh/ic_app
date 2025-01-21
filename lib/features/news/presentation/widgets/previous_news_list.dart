import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/previous_news_card.dart';

class PreviousNewsList extends StatelessWidget {
  const PreviousNewsList({super.key, required this.newsList});
  final NewsList newsList;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Column(
              children: [
                for (int i = 3; i < newsList.newsList.length; i++)
                  PreviousNewsCard(
                    title: newsList.newsList[i]['title'].toString(),
                    imageUrl: newsList.newsList[i]['image_url'].toString(),
                    index: i,
                  )
              ],
            ));
  }
}
