import 'package:debug_bricks_device_info/debug_bricks_device_info.dart';
import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';
import 'package:debug_bricks_fcm_token/debug_bricks_fcm_token.dart';
import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:debug_screen_example/router.dart';
import 'package:debug_screen_example/screen/debug/components/open_subscription_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';
import 'components/endpoints.dart';
import 'components/free_attempts.dart';
import 'components/group_name.dart';
import 'components/premium_mode.dart';
import 'components/reset_abtest.dart';
import 'components/reset_onboarding.dart';

class DebugSettingsScreen extends StatelessWidget {
  static const route = '/$subRoute';
  static const subRoute = 'debugSettings';

  const DebugSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings_debug.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GroupName("Configuration"),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    const PremiumModeView(),
                    const Endpoints(),
                    const FreeAttempts(),
                    EasyLocalizationBrick(
                      title: LocaleKeys.language.tr(),
                    ),
                    TextBrick(
                      title: "Open localization keys",
                      infoIconData: Icons.language,
                      actionIconData: Icons.navigate_next,
                      onTap: () {
                        context.goLocalizationsScreen();
                      },
                    )
                  ],
                ),
              ),
            ),
            const GroupName("Actions"),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: const [
                    ResetOnboarding(),
                    ResetAbTest(),
                    OpenSubscriptionScreen(),
                  ],
                ),
              ),
            ),
            const GroupName("Info"),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    DeviceInfoBrick(),
                    const FcmTokenBrick(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
