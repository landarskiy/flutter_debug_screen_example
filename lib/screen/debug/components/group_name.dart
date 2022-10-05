import 'package:flutter/material.dart';

class GroupName extends StatelessWidget {
  final String name;

  const GroupName(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final groupStyle =
        theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        name,
        style: groupStyle,
      ),
    );
  }
}
