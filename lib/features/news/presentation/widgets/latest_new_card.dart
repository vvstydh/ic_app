import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';
import 'package:ic_app/features/news/domain/news_list.dart';
import 'package:ic_app/features/news/presentation/widgets/big_image_widget.dart';

class LatestNewCard extends StatelessWidget {
  const LatestNewCard({
    super.key,
    required this.imageUrl,
    required this.index,
  });
  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => context.push('/content', extra: index),
        child: BigImageWidget(imageUrl: imageUrl));
  }
}
