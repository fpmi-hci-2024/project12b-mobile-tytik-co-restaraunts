import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_delivery/src/config/router/app_router.dart';
import 'package:monkey_delivery/src/core/widgets/custom_text_field.dart';
import 'package:monkey_delivery/src/feature/auth_page/presentation/new_sign_in_bloc/new_sign_in_bloc.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../locator/locator.dart';
import 'config/auth_page_theme.dart';

@RoutePage()
class NewSignInPage extends StatelessWidget {
  const NewSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<AuthTheme>();
    return BlocProvider(
      create: (_) => locator<NewSignInBloc>()
        ..add(
          const LoadUserInformation(),
        ),
      child: Builder(builder: (context) {
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
          body: BlocBuilder<NewSignInBloc, NewSignInState>(
              builder: (context, state) {
            final bloc = context.read<NewSignInBloc>();
            return Stack(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Write your contact info!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
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
                        placeholderText: 'Name',
                        initialText: state.userInformation.name,
                        onChanged: (value) {
                          bloc.add(
                            TextFieldChanged(
                              newName: value,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      CustomTextField(
                        placeholderText: 'Address',
                        initialText: state.userInformation.address,
                        onChanged: (value) {
                          bloc.add(
                            TextFieldChanged(
                              newAddress: value,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      CustomButton.auth(
                        onTap: () {
                          bloc.add(const SaveNewInfo());
                          appRouter.replace(const HomeRoute());
                        },
                        text: 'Go To Application!',
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
