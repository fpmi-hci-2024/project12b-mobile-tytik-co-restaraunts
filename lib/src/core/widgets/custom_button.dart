import 'package:flutter/material.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double height;
  final String text;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    this.height = 41,
    this.width,
    this.text = '',
    this.onTap,
  });

  const CustomButton.auth({
    super.key,
    this.width = 200,
    this.height = 41,
    this.text = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.primaryBorderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: theme.commonTextStyle,
          ),
        ),
      ),
    );
  }
}
