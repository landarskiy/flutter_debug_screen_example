import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:flutter/material.dart';

import '../../../environment.dart';

class Endpoints extends StatefulWidget {
  const Endpoints({Key? key}) : super(key: key);

  @override
  State<Endpoints> createState() => _EndpointsState();
}

class _EndpointsState extends State<Endpoints> {
  List<String> endpoints = [];
  String? _activeEndpoint;

  @override
  void initState() {
    super.initState();
    endpoints = DebugEnvironment.endpoints;
    _loadActiveEndpoint();
  }

  @override
  Widget build(BuildContext context) {
    final items = endpoints
        .map(
          (endpoint) => RadioBrick(
            title: endpoint,
            value: endpoint,
            groupValue: _activeEndpoint,
            changeListener: (value) {
              final env = Environment.getEnvironment();
              if (value != null && env is DebugEnvironment) {
                env.updateServerEndpoint(value);
                setState(() {
                  _activeEndpoint = value;
                });
              }
            },
          ),
        )
        .toList();
    return ExpandableBrick(
      title: "Endpoint",
      subtitle: _activeEndpoint,
      initiallyExpanded: false,
      children: items,
    );
  }

  _loadActiveEndpoint() {
    Environment.getEnvironment().serverEndpoint().then(
          (activeEndpoint) => {
            setState(
              () {
                _activeEndpoint = activeEndpoint;
              },
            ),
          },
        );
  }
}
