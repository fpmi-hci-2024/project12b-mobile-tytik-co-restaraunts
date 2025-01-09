import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/config/router/app_router.dart';
import 'package:monkey_delivery/src/core/widgets/custom_text_field.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
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
      appBar: CustomAppBar(
        titleText: theme.appName,
        height: 100,
        borderColor: theme.primaryBorderColor,
        titleStyle: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
        ),
      ),
      webMaxWidth: 600,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 53,
                ),
                Text(
                  theme.signInText,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  placeholderText: theme.loginText,
                ),
                const SizedBox(
                  height: 19,
                ),
                CustomTextField(
                  placeholderText: theme.passwordText,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      theme.forgotPasswordButtonText,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: theme.primaryBorderColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                CustomButton.auth(
                  text: theme.signInButtonText,
                  onTap: () {
                    appRouter.popAndPush(
                      const HomeRoute(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    theme.orText,
                  ),
                ),
                CustomButton.auth(
                  onTap: () {
                    appRouter.push(const RegisterRoute());
                  },
                  text: theme.registerButtonText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
