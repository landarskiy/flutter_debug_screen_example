import 'package:debug_screen_example/main.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class LogsScreen extends TalkerScreen {
  static const route = '/$subRoute';
  static const subRoute = 'logs';

  LogsScreen({Key? key, TalkerScreenTheme theme = const TalkerScreenTheme()})
      : super(
          key: key,
          talker: logger,
          appBarTitle: "Logs",
          theme: theme,
        );
}
