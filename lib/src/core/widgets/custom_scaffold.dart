import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final double webMaxWidth;
  final bool resizeToAvoidBottomInset;

  const CustomScaffold({
    required this.body,
    this.appBar,
    this.webMaxWidth = 0,
    this.resizeToAvoidBottomInset = false,
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
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: appBar,
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: kIsWeb ? webMaxWidth : double.infinity,
              ),
              child: body,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class MobileDesignWidget extends StatelessWidget {
  final maxWebAppRatio = 4.8 / 6.0;
  final minWebAppRatio = 9.0 / 16.0;

  final Widget child;

  MobileDesignWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight < constraints.maxWidth) {
          return Container(
            alignment: Alignment.center,
            child: ClipRect(
              child: AspectRatio(
                aspectRatio: getCurrentWebAppRatio(),
                child: child,
              ),
            ),
          );
        }
        return child;
      },
    );
  }

  double getCurrentWebAppRatio() {
    double currentWebAppRatio = minWebAppRatio;

    // Fixed ratio for Web
    var physicalScreenSize = ui.window.physicalSize;
    var physicalWidth = physicalScreenSize.width;
    var physicalHeight = physicalScreenSize.height;

    currentWebAppRatio = physicalWidth / physicalHeight;
    if (currentWebAppRatio > maxWebAppRatio) {
      currentWebAppRatio = maxWebAppRatio;
    } else if (currentWebAppRatio < minWebAppRatio) {
      currentWebAppRatio = minWebAppRatio;
    }
    return currentWebAppRatio;
  }
}
