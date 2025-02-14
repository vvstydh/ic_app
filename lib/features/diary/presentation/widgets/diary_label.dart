import 'package:flutter/widgets.dart';
import 'package:ic_app/core/app/theme/theme.dart';

class DiaryLabel extends StatelessWidget {
  const DiaryLabel({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Text(
        label,
        style: theme.textTheme.labelLarge,
      ),
    );
  }
}
