import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/widgets/cafe_card.dart';

import '../../../core/domain/entities/cafe.dart';
import '../../../core/widgets/custom_scaffold.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                childAspectRatio: 4,
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
