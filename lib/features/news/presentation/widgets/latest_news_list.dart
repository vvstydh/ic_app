import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/latest_new_card.dart';

class LatestNewsList extends StatelessWidget {
  const LatestNewsList({super.key, required this.newsList});
  final NewsList newsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 310,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Observer(builder: (_) {
                final item = newsList.newsList[index];
                return LatestNewCard(
                  imageUrl: item['image_url'].toString(),
                  index: index,
                );
              });
            }));
  }
}
