import 'package:flutter/material.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget(
      {super.key,
      required this.text,
      this.onPressed,
      required this.needChanges});
  final String text;
  final VoidCallback? onPressed;
  final bool needChanges;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.translate(
            offset: Offset(0, 3),
            child: Text(
              text,
              style: theme.textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          needChanges
              ? IconButton(
                  icon: Icon(Icons.edit, color: theme.colorScheme.onTertiary),
                  onPressed: onPressed,
                  highlightColor: theme.colorScheme.tertiary,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
