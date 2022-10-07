import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:debug_screen_example/router.dart';
import 'package:flutter/material.dart';

class OpenLogs extends StatelessWidget {
  const OpenLogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextBrick(
      title: "Logs",
      infoIconData: Icons.document_scanner,
      actionIconData: Icons.navigate_next,
      onTap: () {
        context.goLogsScreen();
      },
    );
  }
}
