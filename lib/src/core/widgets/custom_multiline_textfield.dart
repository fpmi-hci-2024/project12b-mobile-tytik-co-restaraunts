import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CustomMultilineTextField extends StatelessWidget {
  final double height;
  final double? width;
  final String placeholderText;

  const CustomMultilineTextField({
    this.height = 100,
    this.width,
    this.placeholderText = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return Container(
      clipBehavior: Clip.hardEdge,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: theme.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: theme.primaryBorderColor,
          width: 1,
        ),
      ),
      child: SizedBox(
        height: height,
        child: TextField(
          style: theme.commonTextStyle,
          textAlign: TextAlign.start,
          maxLines: 4,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            border: InputBorder.none,
            hintText: placeholderText,
            hintStyle: theme.commonTextStyle,
          ),
        ),
      ),
    );
  }
}
