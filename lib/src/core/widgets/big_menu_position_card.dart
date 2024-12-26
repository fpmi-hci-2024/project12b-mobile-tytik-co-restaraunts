import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';
import 'package:monkey_delivery/src/core/widgets/items_counter.dart';

import '../../locator/locator.dart';
import 'image_with_border.dart';
import 'config/common_widgets_theme.dart';

class BigMenuPositionCard extends StatelessWidget {
  final MenuPosition menuPosition;
  final double height;
  final double width;
  final VoidCallback? onTap;
  final Function(int) onCountChanged;

  const BigMenuPositionCard({
    required this.menuPosition,
    super.key,
    this.height = 320,
    this.width = 320,
    this.onTap,
    required this.onCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        clipBehavior: Clip.antiAlias,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          child: Column(
            children: [
              Text(
                menuPosition.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${menuPosition.cost.toStringAsFixed(1)}\$',
              ),
              const SizedBox(
                height: 10,
              ),
              ImageWithBorder(
                height: 100,
                width: 200,
                url: menuPosition.imageUrl,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    for (var ingredient in menuPosition.ingredients ?? [])
                      TextSpan(
                        text: ingredient +
                            (menuPosition.ingredients?.last == ingredient
                                ? '.'
                                : ', '),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      )
                  ],
                ),
              ),
              if (menuPosition.count > 0) ...[
                ItemsCounter(
                  onValueChanged: onCountChanged,
                  value: menuPosition.count,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
