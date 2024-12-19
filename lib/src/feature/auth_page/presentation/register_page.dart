import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/config/router/app_router.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../locator/locator.dart';
import 'config/auth_page_theme.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () async {
                  if (!(await appRouter.maybePop())) {
                    appRouter.replaceNamed('/sign_in');
                  }
                },
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                    children: [
                      const TextSpan(text: 'Already have an Account? '),
                      TextSpan(
                        text: 'Sign in!',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  placeholderText: 'Name',
                ),
                const SizedBox(
                  height: 19,
                ),
                CustomTextField(
                  placeholderText: 'E-mail',
                ),
                const SizedBox(
                  height: 19,
                ),
                CustomTextField(
                  placeholderText: 'Password',
                ),
                const SizedBox(
                  height: 19,
                ),
                CustomTextField(
                  placeholderText: 'Confirm Password',
                ),
                const SizedBox(
                  height: 38,
                ),
                CustomButton.auth(
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
