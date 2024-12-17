import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String titleText;
  final TextStyle? titleStyle;
  final double? height;
  final Color borderColor;
  final double borderWidth;

  CustomAppBar({
    super.key,
    this.titleText = '',
    this.titleStyle,
    this.height,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
  }) : super(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: height,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9),
            child: Text(
              titleText,
              style: titleStyle,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(borderWidth),
            child: Container(
              color: borderColor,
              height: borderWidth,
            ),
          ),
        );
}
