import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:debug_screen_example/router.dart';
import 'package:flutter/material.dart';

class OpenLocalizationKeys extends StatelessWidget {
  const OpenLocalizationKeys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextBrick(
      title: "Localization keys",
      infoIconData: Icons.language,
      actionIconData: Icons.navigate_next,
      onTap: () {
        context.goLocalizationsScreen();
      },
    );
  }
}
