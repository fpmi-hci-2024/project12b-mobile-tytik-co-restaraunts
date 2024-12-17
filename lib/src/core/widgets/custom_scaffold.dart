import 'package:flutter/material.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return Scaffold(
      backgroundColor: theme.primaryBackgroundColor,
      body: body,
    );
  }
}
