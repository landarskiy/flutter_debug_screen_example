import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';

import '../../../environment.dart';

class PremiumModeView extends StatefulWidget {
  const PremiumModeView({Key? key}) : super(key: key);

  @override
  State<PremiumModeView> createState() => _PremiumModeViewState();
}

class _PremiumModeViewState extends State<PremiumModeView> {
  PremiumMode _activeMode = PremiumMode.app;

  @override
  void initState() {
    super.initState();
    _loadActivePremiumMode();
  }

  @override
  Widget build(BuildContext context) {
    final items = PremiumMode.values
        .map(
          (mode) => RadioBrick(
            title: mode.name,
            value: mode,
            groupValue: _activeMode,
            changeListener: (value) {
              final env = Environment.getEnvironment();
              if (value != null && env is DebugEnvironment) {
                env.updatePremiumMode(value);
                setState(() {
                  _activeMode = value;
                });
              }
            },
          ),
        )
        .toList();
    return ExpandableBrick(
      title: "Premium Mode",
      subtitle: _activeMode.name,
      initiallyExpanded: false,
      children: items,
    );
  }

  _loadActivePremiumMode() {
    Environment.getEnvironment().premiumMode().then(
          (activeMode) => {
            setState(
              () {
                _activeMode = activeMode;
              },
            ),
          },
        );
  }
}
