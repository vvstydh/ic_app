import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class PreviousNewsCard extends StatelessWidget {
  const PreviousNewsCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.index});
  final String title;
  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/content', extra: index),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 150,
        decoration: BoxDecoration(
          color: theme.colorScheme.tertiary,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 180,
                    ),
                    child: Transform.translate(
                      offset: Offset(0, 3),
                      child: Text(
                        title,
                        style: theme.textTheme.labelMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
