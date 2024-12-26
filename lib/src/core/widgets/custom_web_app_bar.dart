import 'package:flutter/material.dart';

import '../../config/router/app_router.dart';

class CustomWebAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final TextStyle? titleStyle;
  final double height;
  final Color borderColor;
  final double borderWidth;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onTrailingTap;
  final double webContentWidth;
  final bool addGoBackButton;

  const CustomWebAppBar({
    super.key,
    this.titleText = '',
    this.titleStyle,
    this.height = kToolbarHeight,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
    this.leadingIcon,
    this.trailingIcon,
    this.webContentWidth = double.infinity,
    this.onLeadingTap,
    this.onTrailingTap,
    this.addGoBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: webContentWidth,
            ),
            child: Container(
              height: height,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (addGoBackButton)
                    GestureDetector(
                      onTap: () {
                        appRouter.maybePop();
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  const Spacer(),
                  leadingIcon != null
                      ? GestureDetector(
                          onTap: onLeadingTap,
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: leadingIcon,
                          ),
                        )
                      : const SizedBox(width: 16.0),
                  trailingIcon != null
                      ? GestureDetector(
                          onTap: onTrailingTap,
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: trailingIcon,
                          ),
                        )
                      : const SizedBox(width: 16.0),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: borderColor,
          height: borderWidth,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height + borderWidth);
}
