import 'package:flutter/material.dart';
import 'package:ic_app/features/news/presentation/widgets/latest_new_card.dart';

class LatestNewsList extends StatelessWidget {
  const LatestNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return LatestNewCard();
          }),
    );
  }
}
