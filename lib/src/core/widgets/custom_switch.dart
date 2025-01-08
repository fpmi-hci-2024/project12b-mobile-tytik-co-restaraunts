import 'package:flutter/material.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CustomSwitch extends StatefulWidget {
  final String leftName;
  final String rightName;
  final Function(int index) onTap;
  final double width;

  const CustomSwitch({
    super.key,
    required this.leftName,
    required this.rightName,
    required this.onTap,
    this.width = 200,
  });

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _onTap(0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: _selectedIndex != 0
                      ? const BorderRadius.vertical(
                          bottom: Radius.circular(5),
                        )
                      : BorderRadius.circular(5),
                  border: Border(
                    bottom: BorderSide(
                      color: theme.primaryBorderColor,
                      width: 1,
                    ),
                    top: _selectedIndex == 0
                        ? BorderSide(
                            color: theme.primaryBorderColor,
                            width: 1,
                          )
                        : BorderSide.none,
                    left: _selectedIndex == 0
                        ? BorderSide(
                            color: theme.primaryBorderColor,
                            width: 1,
                          )
                        : BorderSide.none,
                    right: _selectedIndex == 0
                        ? BorderSide(
                            color: theme.primaryBorderColor,
                            width: 1,
                          )
                        : BorderSide.none,
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.leftName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: _selectedIndex == 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _onTap(1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: _selectedIndex != 1
                      ? const BorderRadius.vertical(
                          bottom: Radius.circular(5),
                        )
                      : BorderRadius.circular(5),
                  border: Border(
                    bottom: BorderSide(
                      color: theme.primaryBorderColor,
                      width: 1,
                    ),
                    top: _selectedIndex == 1
                        ? BorderSide(
                            color: theme.primaryBorderColor,
                            width: 1,
                          )
                        : BorderSide.none,
                    left: _selectedIndex == 1
                        ? BorderSide(
                            color: theme.primaryBorderColor,
                            width: 1,
                          )
                        : BorderSide.none,
                    right: _selectedIndex == 1
                        ? BorderSide(
                            color: theme.primaryBorderColor,
                            width: 1,
                          )
                        : BorderSide.none,
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.rightName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: _selectedIndex == 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
