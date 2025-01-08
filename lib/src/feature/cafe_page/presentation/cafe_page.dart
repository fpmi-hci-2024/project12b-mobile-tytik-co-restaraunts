import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_delivery/src/config/router/app_router.dart';
import 'package:monkey_delivery/src/core/domain/entities/cafe.dart';
import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';
import 'package:monkey_delivery/src/core/widgets/custom_button.dart';
import 'package:monkey_delivery/src/core/widgets/custom_switch.dart';
import 'package:monkey_delivery/src/core/widgets/image_with_border.dart';
import 'package:monkey_delivery/src/core/widgets/items_counter.dart';
import 'package:monkey_delivery/src/core/widgets/menu_position_card.dart';

import '../../../core/widgets/big_cafe_card.dart';
import '../../../core/widgets/big_menu_position_card.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/cutom_app_bar_wrapper.dart';
import '../../../locator/locator.dart';
import 'bloc/cafe_bloc.dart';
import 'config/cafe_page_theme.dart';

@RoutePage()
class CafePage extends StatelessWidget {
  final Cafe cafe;

  const CafePage({required this.cafe, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<CafeTheme>();
    return BlocProvider<CafeBloc>(
      create: (_) => locator<CafeBloc>()
        ..add(
          InitCafeData(
            cafe,
          ),
        ),
      child: Builder(builder: (context) {
        return CustomScaffold(
          appBar: CustomAppBarWrapper(
            addGoBackButton: true,
            titleText: theme.appName,
            height: 50,
            /*leadingIcon: const Icon(
              Icons.settings,
            ),*/
            trailingIcon: const Icon(
              Icons.shopping_cart,
            ),
            onTrailingTap: () {
              context.router.push(
                CartRoute(cafeBloc: context.read<CafeBloc>()),
              );
            },
            webContentWidth: 660,
          ),
          webMaxWidth: 660,
          body: BlocBuilder<CafeBloc, CafeState>(
            builder: (context, state) {
              if (!state.dataLoaded) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryBorderColor,
                  ),
                );
              }
              final bloc = context.read<CafeBloc>();
              final itemsToShow = state.menu
                  .where((element) => element.type == state.selectedType)
                  .toList();
              return kIsWeb
                  ? ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: CustomButton(
                            text: state.cafe.name,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: CustomSwitch(
                            leftName: 'Food',
                            rightName: 'Drinks',
                            onTap: (int index) {
                              if (index == 0) {
                                bloc.add(
                                  const ChangePositionType(
                                      MenuPositionType.food),
                                );
                              } else {
                                bloc.add(
                                  const ChangePositionType(
                                      MenuPositionType.drink),
                                );
                              }
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: itemsToShow.map((item) {
                                return SizedBox(
                                  width: (660 - 60) / 2,
                                  height: 300,
                                  child: BigMenuPositionCard(
                                    onCountChanged: (int count) {
                                      context.read<CafeBloc>().add(
                                            ChangeMenuPositionCount(
                                              id: item.id,
                                              newCount: count,
                                            ),
                                          );
                                    },
                                    menuPosition: item,
                                    onTap: () =>
                                        _showBottomSheet(context, item),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: BigCafeCard(
                              cafe: state.cafe,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: CustomSwitch(
                            leftName: 'Food',
                            rightName: 'Drinks',
                            onTap: (int index) {
                              if (index == 0) {
                                bloc.add(
                                  const ChangePositionType(
                                      MenuPositionType.food),
                                );
                              } else {
                                bloc.add(
                                  const ChangePositionType(
                                      MenuPositionType.drink),
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 25,
                          ),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => MenuPositionCard(
                              onCountChanged: (int count) {
                                context.read<CafeBloc>().add(
                                      ChangeMenuPositionCount(
                                        id: itemsToShow[index].id,
                                        newCount: count,
                                      ),
                                    );
                              },
                              menuPosition: itemsToShow[index],
                              onTap: () async => await _showBottomSheet(
                                context,
                                itemsToShow[index],
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 25,
                            ),
                            itemCount: itemsToShow.length,
                          ),
                        ),
                      ],
                    );
            },
          ),
        );
      }),
    );
  }

  Future<void> _showBottomSheet(
    BuildContext context,
    MenuPosition position,
  ) async {
    final theme = locator<CafeTheme>();
    final cafeBloc = context.read<CafeBloc>();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (bottomSheetContext) {
        return BlocProvider.value(
          value: cafeBloc,
          child: BlocBuilder<CafeBloc, CafeState>(
            builder: (context, state) {
              final updatedPosition =
                  state.menu.firstWhere((item) => item.id == position.id);

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: theme.bottomSheetColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          updatedPosition.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Cost: ${updatedPosition.cost.toStringAsFixed(1)}\$',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: ImageWithBorder(
                            url: updatedPosition.imageUrl,
                            width: 250,
                            height: 166.7,
                          ),
                        ),
                        if (updatedPosition.ingredients != null) ...[
                          const SizedBox(height: 16.0),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Ingredients:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          _BulletList(items: updatedPosition.ingredients ?? []),
                        ],
                        const SizedBox(height: 16.0),
                        if (updatedPosition.count == 0)
                          CustomButton(
                            text: 'Add To Cart',
                            width: 200,
                            height: 41,
                            onTap: () {
                              context.read<CafeBloc>().add(
                                    ChangeMenuPositionCount(
                                      id: updatedPosition.id,
                                      newCount: 1,
                                    ),
                                  );
                            },
                          )
                        else
                          ItemsCounter(
                            onValueChanged: (value) {
                              context.read<CafeBloc>().add(
                                    ChangeMenuPositionCount(
                                      id: updatedPosition.id,
                                      newCount: value,
                                    ),
                                  );
                            },
                            value: updatedPosition.count,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;

  const _BulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '• ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
