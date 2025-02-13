import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/core/app/widgets/app_appbar.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/latest_news_list.dart';
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
        appBar: AppAppbar(
          appBarText: 'Новости',
          height: 40,
          back: false,
          color: theme.colorScheme.primary,
        ),
        body: SwipeRefresh.adaptive(
            stateStream: _stream,
            onRefresh: () async {
              await newsList.getNewsList();
              _controller.sink.add(SwipeRefreshState.hidden);
            },
            indicatorColor: theme.colorScheme.secondary,
            padding: const EdgeInsets.only(top: 10, bottom: 120),
            children: [
              LatestNewsList(
                newsList: newsList,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  'Предыдущие новости',
                  style: theme.textTheme.labelLarge,
                ),
              ),
              PreviousNewsList(newsList: newsList)
            ]));
  }
}
