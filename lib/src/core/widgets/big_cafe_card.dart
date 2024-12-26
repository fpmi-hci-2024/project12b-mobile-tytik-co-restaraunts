import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_delivery/src/config/router/app_router.dart';
import 'package:monkey_delivery/src/core/domain/entities/cafe.dart';
import 'package:monkey_delivery/src/core/widgets/image_with_border.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class BigCafeCard extends StatelessWidget {
  final Cafe cafe;
  final double height;
  final double width;
  final double subsectionHeight;
  final VoidCallback? onTap;
  final String? title;

  const BigCafeCard({
    required this.cafe,
    super.key,
    this.height = 300,
    this.width = 300,
    this.subsectionHeight = 80,
    this.onTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return GestureDetector(
      onTap: () {
        appRouter.push(const CafeRoute());
      },
      child: Stack(
        children: [
          ImageWithBorder(
            height: height,
            width: width,
            borderRadius: 10,
            url:
                'https://img.pikbest.com/origin/09/70/06/222pIkbEsTrCh.jpg!sw800',
          ),
          Positioned(
            bottom: 1,
            left: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: kIsWeb ? 20 : 0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffE9E2D6).withAlpha(188),
                ),
                width: width - 2,
                height: subsectionHeight,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title ?? cafe.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
