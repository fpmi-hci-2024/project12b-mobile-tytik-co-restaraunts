import 'package:flutter/material.dart';

class ItemsCounter extends StatefulWidget {
  final Function(int) onValueChanged;
  final int value;
  final bool showButtons;

  const ItemsCounter({
    super.key,
    required this.onValueChanged,
    required this.value,
    this.showButtons = true,
  });

  @override
  State<ItemsCounter> createState() => _ItemsCounterState();
}

class _ItemsCounterState extends State<ItemsCounter> {
  @override
  void initState() {
    super.initState();
  }

  TextStyle get _textStyle => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showButtons)
          InkWell(
            onTap: () => widget.onValueChanged(widget.value - 1),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                '-',
                style: _textStyle,
              ),
            ),
          ),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.value.toString(),
          style: _textStyle,
        ),
        const SizedBox(
          width: 5,
        ),
        if (widget.showButtons)
          InkWell(
            onTap: () => widget.onValueChanged(widget.value + 1),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                '+',
                style: _textStyle,
              ),
            ),
          )
      ],
    );
  }
}
