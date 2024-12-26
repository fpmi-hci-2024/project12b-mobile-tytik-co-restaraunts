import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_delivery/src/core/widgets/cafe_card.dart';
import 'package:monkey_delivery/src/core/widgets/custom_text_field.dart';
import 'package:monkey_delivery/src/core/widgets/cutom_app_bar_wrapper.dart';
import 'package:monkey_delivery/src/feature/home_page/presentation/bloc/home_bloc.dart';

import '../../../config/router/app_router.dart';
import '../../../core/domain/entities/cafe.dart';
import '../../../core/widgets/big_cafe_card.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../locator/locator.dart';
import 'config/home_page_theme.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<HomeTheme>();
    return BlocProvider<HomeBloc>(
      create: (_) => locator<HomeBloc>()
        ..add(
          const InitHomePage(),
        ),
      child: CustomScaffold(
        appBar: CustomAppBarWrapper(
          titleText: theme.appName,
          height: 50,
          leadingIcon: const Icon(
            Icons.settings,
          ),
          trailingIcon: const Icon(
            Icons.person,
          ),
          webContentWidth: 660,
        ),
        webMaxWidth: 660,
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          final items = state.showSearchResults
              ? state.searchResultCafes
              : state.allCafes;
          if (!state.pageLoaded) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.primaryBorderColor,
              ),
            );
          }
          final bloc = context.read<HomeBloc>();
          return kIsWeb
              ? ListView(
                  shrinkWrap: true,
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          right: 40,
                          left: 20,
                        ),
                        child: CustomTextField(
                          placeholderText: 'Search',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) => BigCafeCard(
                            onTap: () {
                              appRouter.push(
                                CafeRoute(
                                  cafe: items[index],
                                ),
                              );
                            },
                            cafe: items[index],
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: BigCafeCard(
                          height: state.query.isEmpty ? 300 : 80,
                          cafe: state.bestDaily,
                          title: 'Top Daily',
                          onTap: () {
                            appRouter.push(
                              CafeRoute(
                                cafe: state.bestDaily,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      child: CustomTextField(
                        placeholderText: 'Search',
                        width: 200,
                        onChanged: (String value) {
                          bloc.add(
                            QueryChanged(value),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: theme.primaryBorderColor,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => CafeCard(
                          onTap: () {
                            appRouter.push(
                              CafeRoute(
                                cafe: items[index],
                              ),
                            );
                          },
                          cafe: items[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 25,
                        ),
                        itemCount: items.length,
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
