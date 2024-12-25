import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../locator/locator.dart';
import 'config/common_widgets_theme.dart';

class ImageWithBorder extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final String url;

  const ImageWithBorder({
    super.key,
    this.height = 50,
    this.width = 50,
    this.borderRadius = 5,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final theme = locator<CommonWidgetsTheme>();
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: theme.primaryBorderColor,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - 1),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl:
              url,
        ),
      ),
    );
  }
}
