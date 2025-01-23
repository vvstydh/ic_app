import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/latest_news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/previous_news_card.dart';
import 'package:ic_app/features/news/presentation/widgets/previous_news_list.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key, required this.newsList});
  final NewsList newsList;

  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: theme.colorScheme.primary,
        appBar: const AppAppbar(
          appBarText: 'Новости',
          height: 40,
          back: false,
        ),
        body: SwipeRefresh.adaptive(
            stateStream: _stream,
            onRefresh: () async {
              await newsList.getNewsList();
              _controller.sink.add(SwipeRefreshState.hidden);
            },
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 120),
            children: [
              LatestNewsList(
                newsList: newsList,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  'Предыдущие новости',
                  style: theme.textTheme.labelLarge,
                ),
              ),
              PreviousNewsList(newsList: newsList)
            ]));
  }
}
