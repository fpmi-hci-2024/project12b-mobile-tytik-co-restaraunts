import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';

import '../../locator/locator.dart';
import 'image_with_border.dart';
import 'config/common_widgets_theme.dart';

class MenuPositionCard extends StatelessWidget {
  final MenuPosition menuPosition;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const MenuPositionCard({
    required this.menuPosition,
    super.key,
    this.height = 100,
    this.width = 320,
    this.onTap,
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
                          for (var ingredient in menuPosition.ingredients ?? [])
                            TextSpan(
                              text: ingredient +
                                  (menuPosition.ingredients?.last == ingredient
                                      ? '.'
                                      : ', '),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
