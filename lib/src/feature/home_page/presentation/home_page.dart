import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_delivery/src/core/widgets/cafe_card.dart';
import 'package:monkey_delivery/src/core/widgets/custom_text_field.dart';
import 'package:monkey_delivery/src/core/widgets/cutom_app_bar_wrapper.dart';

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
      Cafe(
        id: '5',
        name: 'Cafe 5',
        rating: 3.6,
      ),
      Cafe(
        id: '6',
        name: 'Cafe 6',
        rating: 3.3,
      ),
      Cafe(
        id: '7',
        name: 'Cafe 7',
        rating: 0.5,
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
          ? ListView(
              shrinkWrap: true,
              children: [
                Align(
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
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) => BigCafeCard(
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
                      cafe: items[0],
                      title: 'Top Daily',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: CustomTextField(
                    placeholderText: 'Search',
                    width: 200,
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
                      cafe: items[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 25,
                    ),
                    itemCount: items.length,
                  ),
                ),
              ],
            ),
    );
  }
}
