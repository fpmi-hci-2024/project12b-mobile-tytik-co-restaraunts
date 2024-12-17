import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
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
        titleText: 'Tytik&CO',
        height: 100,
        borderColor: theme.primaryBorderColor,
        titleStyle: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 53,
                ),
                Text(
                  'Sign In',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  placeholderText: 'Login',
                ),
                SizedBox(
                  height: 19,
                ),
                CustomTextField(
                  placeholderText: 'Password',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
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
                SizedBox(
                  height: 13,
                ),
                CustomButton.auth(
                  text: 'Sign In',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('OR'),
                ),
                CustomButton.auth(
                  text: 'Register',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
