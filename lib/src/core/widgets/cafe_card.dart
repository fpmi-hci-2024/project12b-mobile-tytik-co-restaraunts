import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monkey_delivery/src/core/domain/entities/cafe.dart';
import 'package:monkey_delivery/src/core/widgets/cafe_logo.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class CafeCard extends StatelessWidget {
  final Cafe cafe;
  final double height;
  final double width;

  const CafeCard({
    required this.cafe,
    super.key,
    this.height = 80,
    this.width = 320,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return Container(
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
            const CafeLogo(),
            const SizedBox(
              width: 6,
            ),
            Text(
              cafe.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Text(
              '${cafe.rating?.toStringAsFixed(1)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            SvgPicture.asset(
              'assets/star.svg',
            ),
          ],
        ),
      ),
    );
  }
}
