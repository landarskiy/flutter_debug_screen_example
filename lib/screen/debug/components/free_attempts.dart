import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';

import '../../../environment.dart';

class FreeAttempts extends StatefulWidget {
  const FreeAttempts({Key? key}) : super(key: key);

  @override
  State<FreeAttempts> createState() => _FreeAttemptsState();
}

class _FreeAttemptsState extends State<FreeAttempts> {
  int _attempts = 0;

  @override
  void initState() {
    super.initState();
    _loadAttemptsCount();
  }

  @override
  Widget build(BuildContext context) {
    return SliderBrick(
      title: "Free attempts",
      subtitle: "$_attempts",
      minValue: 0,
      maxValue: 10,
      divisions: 10,
      value: _attempts.toDouble(),
      changeListener: (value) {
        final env = Environment.getEnvironment();
        if (env is DebugEnvironment) {
          env.updateFreeAttemptsCount(value.toInt());
          setState(() {
            _attempts = value.toInt();
          });
        }
      },
    );
  }

  _loadAttemptsCount() {
    Environment.getEnvironment().freeAttemptsCount().then(
          (attempts) => {
            setState(
              () {
                _attempts = attempts;
              },
            ),
          },
        );
  }
}
