import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../config/router/app_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final TextStyle? titleStyle;
  final double? height;
  final Color borderColor;
  final double borderWidth;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onTrailingTap;
  final bool addGoBackButton;

  const CustomAppBar({
    super.key,
    this.titleText = '',
    this.titleStyle,
    this.height = kToolbarHeight,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
    this.leadingIcon,
    this.trailingIcon,
    this.onLeadingTap,
    this.onTrailingTap,
    this.addGoBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (addGoBackButton)
              GestureDetector(
                onTap: () {
                  appRouter.maybePop();
                },
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
            if (leadingIcon != null)
              GestureDetector(
                onTap: onLeadingTap,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: leadingIcon,
                ),
              )
            else
              const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                titleText,
                style: titleStyle ??
                    const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            if (addGoBackButton)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.transparent,
                ),
              ),
            if (trailingIcon != null)
              GestureDetector(
                onTap: onTrailingTap,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: trailingIcon,
                ),
              )
            else
              const SizedBox(width: 16.0),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
