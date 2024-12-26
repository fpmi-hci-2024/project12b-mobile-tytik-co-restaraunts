import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';

import '../../locator/locator.dart';
import 'image_with_border.dart';
import 'config/common_widgets_theme.dart';
import 'items_counter.dart';

class MenuPositionCard extends StatelessWidget {
  final MenuPosition menuPosition;
  final double height;
  final double width;
  final VoidCallback? onTap;
  final Function(int) onCountChanged;
  final bool showFullPrice;

  const MenuPositionCard({
    required this.menuPosition,
    super.key,
    this.height = 100,
    this.width = 320,
    this.onTap,
    required this.onCountChanged,
    this.showFullPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    var price = menuPosition.cost;
    if (showFullPrice) {
      price *= menuPosition.count;
    }
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: menuPosition.count == 0 ? height : height + 60,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.primaryBorderColor,
            width: 1,
          ),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Row(
                children: [
                  ImageWithBorder(
                    height: 70,
                    width: 70,
                    url: menuPosition.imageUrl,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuPosition.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        RichText(
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              for (var ingredient
                                  in menuPosition.ingredients ?? [])
                                TextSpan(
                                  text: ingredient +
                                      (menuPosition.ingredients?.last ==
                                              ingredient
                                          ? '.'
                                          : ', '),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${price.toStringAsFixed(1)}\$',
                  ),
                ],
              ),
            ),
            if (menuPosition.count > 0) ...[
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ItemsCounter(
                  onValueChanged: onCountChanged,
                  value: menuPosition.count,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
