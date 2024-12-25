import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/widgets/custom_web_app_bar.dart';

import 'custom_app_bar.dart';

class CustomAppBarWrapper extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleText;
  final TextStyle? titleStyle;
  final double height;
  final Color borderColor;
  final double borderWidth;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onTrailingTap;
  final double webContentWidth;

  const CustomAppBarWrapper({
    super.key,
    this.titleText = '',
    this.titleStyle,
    this.height = kToolbarHeight,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
    this.leadingIcon,
    this.trailingIcon,
    this.webContentWidth = double.infinity,
    this.onLeadingTap,
    this.onTrailingTap,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return CustomWebAppBar(
        titleText: titleText,
        titleStyle: titleStyle,
        height: height,
        borderColor: borderColor,
        borderWidth: borderWidth,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        webContentWidth: webContentWidth,
        onLeadingTap: onLeadingTap,
        onTrailingTap: onTrailingTap,
      );
    } else {
      return CustomAppBar(
        titleText: titleText,
        titleStyle: titleStyle,
        height: height,
        borderColor: borderColor,
        borderWidth: borderWidth,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        onLeadingTap: onLeadingTap,
        onTrailingTap: onTrailingTap,
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(height + borderWidth);
}
