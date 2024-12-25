import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/widgets/cafe_card.dart';
import 'package:monkey_delivery/src/core/widgets/custom_app_bar.dart';
import 'package:monkey_delivery/src/core/widgets/cutom_app_bar_wrapper.dart';

import '../../../core/domain/entities/cafe.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../locator/locator.dart';
import 'config/home_page_theme.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<HomeTheme>();
    final items = <Cafe>[
      Cafe(
        id: '1',
        name: 'Cafe 1',
        rating: 5.0,
      ),
      Cafe(
        id: '2',
        name: 'Cafe 2',
        rating: 4.0,
      ),
      Cafe(
        id: '3',
        name: 'Cafe 3',
        rating: 3.2,
      ),
      Cafe(
        id: '4',
        name: 'Cafe 4',
        rating: 3.5,
      ),
    ];
    return CustomScaffold(
      appBar: CustomAppBarWrapper(
        titleText: theme.appName,
        height: 50,
        leadingIcon: Icon(
          Icons.settings,
        ),
        trailingIcon: Icon(
          Icons.person,
        ),
        webContentWidth: 660,
      ),
      webMaxWidth: 660,
      body: kIsWeb
          ? GridView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) => CafeCard(
                cafe: items[index],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 3,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => CafeCard(
                  cafe: items[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
                itemCount: items.length,
              ),
            ),
    );
  }
}
