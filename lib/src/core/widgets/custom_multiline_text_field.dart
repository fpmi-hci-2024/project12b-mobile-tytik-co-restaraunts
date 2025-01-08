import 'package:flutter/material.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CustomMultilineTextField extends StatefulWidget {
  final double height;
  final double? width;
  final String placeholderText;
  final String initialText;
  final Function(String)? onChanged;

  const CustomMultilineTextField({
    this.height = 100,
    this.width,
    this.placeholderText = '',
    this.initialText = '',
    this.onChanged,
    super.key,
  });

  @override
  State<CustomMultilineTextField> createState() =>
      _CustomMultilineTextFieldState();
}

class _CustomMultilineTextFieldState extends State<CustomMultilineTextField> {
  final TextEditingController controller = TextEditingController();

  bool isInitialValueSet = false;
  bool ignoreNextDidUpdateWidget = false;

  void _onChanged(String value) {
    ignoreNextDidUpdateWidget = true;
    if (!isInitialValueSet && value.isNotEmpty) {
      isInitialValueSet = true;
    }

    widget.onChanged?.call(value);
  }

  @override
  void initState() {
    controller.text = widget.initialText;

    if (controller.text.isNotEmpty) {
      isInitialValueSet = true;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomMultilineTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!isInitialValueSet && (widget.initialText.isNotEmpty)) {
      setState(() {
        isInitialValueSet = true;
        controller.text = widget.initialText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return Container(
      clipBehavior: Clip.hardEdge,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: theme.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: theme.primaryBorderColor,
          width: 1,
        ),
      ),
      child: SizedBox(
        height: widget.height,
        child: TextField(
          style: theme.commonTextStyle,
          textAlign: TextAlign.start,
          maxLines: 4,
          onChanged: _onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            border: InputBorder.none,
            hintText: widget.placeholderText,
            hintStyle: theme.commonTextStyle,
          ),
        ),
      ),
    );
  }
}
