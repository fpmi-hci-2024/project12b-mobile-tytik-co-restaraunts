import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final double webMaxWidth;

  const CustomScaffold({
    required this.body,
    this.appBar,
    this.webMaxWidth = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: theme.primaryBackgroundColor,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBar,
          body: Center(
            child: Container(
                constraints: BoxConstraints(
                  maxWidth: kIsWeb ? webMaxWidth : double.infinity,
                ),
                child: body),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
