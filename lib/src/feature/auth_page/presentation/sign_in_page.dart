import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/widgets/custom_text_field.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../../locator/locator.dart';
import 'config/auth_page_theme.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<AuthTheme>();
    return CustomScaffold(
      body: Center(
        child: CustomTextField(
          placeholderText: theme.loginText,
        ),
      ),
    );
    ;
  }
}
