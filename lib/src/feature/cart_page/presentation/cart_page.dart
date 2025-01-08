import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_delivery/src/config/router/app_router.dart';
import 'package:monkey_delivery/src/core/widgets/custom_multiline_text_field.dart';
import 'package:monkey_delivery/src/core/widgets/custom_scaffold.dart';
import 'package:monkey_delivery/src/core/widgets/custom_text_field.dart';
import 'package:monkey_delivery/src/feature/cafe_page/presentation/bloc/cafe_bloc.dart';
import 'package:monkey_delivery/src/feature/cart_page/presentation/bloc/cart_bloc.dart';

import '../../../core/domain/entities/cafe.dart';
import '../../../core/domain/entities/menu_position.dart';
import '../../../core/domain/entities/order.dart';
import '../../../core/widgets/big_cafe_card.dart';
import '../../../core/widgets/big_menu_position_card.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/cutom_app_bar_wrapper.dart';
import '../../../core/widgets/menu_position_card.dart';
import '../../../locator/locator.dart';
import 'config/cart_page_theme.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  final CafeBloc cafeBloc;

  const CartPage({required this.cafeBloc, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<CartTheme>();
    return BlocProvider<CartBloc>(
      create: (_) => locator<CartBloc>()..add(const LoadUserInformation()),
      child: BlocProvider<CafeBloc>.value(
        value: cafeBloc,
        child: BlocBuilder<CafeBloc, CafeState>(
          builder: (context, state) {
            var totalCost = 0.0;
            final items =
                state.menu.where((element) => element.count > 0).toList();
            for (var item in items) {
              totalCost += item.cost * item.count;
            }
            return CustomScaffold(
              resizeToAvoidBottomInset: true,
              appBar: CustomAppBarWrapper(
                titleText: theme.appName,
                height: 50,
                addGoBackButton: true,
                webContentWidth: 660,
              ),
              webMaxWidth: 660,
              body: BlocConsumer<CartBloc, CartState>(
                  listener: (oldState, newState) {
                if (newState.orderSent) {
                  if (!kIsWeb) {
                    appRouter.popUntilRoot();
                  } else {
                    appRouter.replace(const HomeRoute());
                  }
                }
              }, builder: (
                context,
                state,
              ) {
                if (!state.isLoaded) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: theme.primaryBorderColor,
                    ),
                  );
                }
                final bloc = context.read<CartBloc>();
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Text(
                            'Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      kIsWeb
                          ? ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: CustomButton(
                                    text: cafeBloc.state.cafe.name,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      children: items.map((item) {
                                        return SizedBox(
                                          width: (660 - 60) / 2,
                                          height: 300,
                                          child: BigMenuPositionCard(
                                            onCountChanged: (int count) {
                                              cafeBloc.add(
                                                ChangeMenuPositionCount(
                                                  id: item.id,
                                                  newCount: count,
                                                ),
                                              );
                                            },
                                            menuPosition: item,
                                            showFullPrice: true,
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
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child:
                                        BigCafeCard(cafe: cafeBloc.state.cafe),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 25,
                                  ),
                                  child: ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        MenuPositionCard(
                                      onCountChanged: (int count) {
                                        cafeBloc.add(
                                          ChangeMenuPositionCount(
                                            id: items[index].id,
                                            newCount: count,
                                          ),
                                        );
                                      },
                                      menuPosition: items[index],
                                      showFullPrice: true,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 25,
                                    ),
                                    itemCount: items.length,
                                  ),
                                ),
                              ],
                            ),
                      CustomTextField(
                        placeholderText: 'Enter You Name',
                        initialText: state.name,
                        onChanged: (value) {
                          bloc.add(
                            TextFieldChanged(
                              newName: value,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholderText: 'Enter You Address',
                        initialText: state.address,
                        onChanged: (value) {
                          bloc.add(
                            TextFieldChanged(
                              newAddress: value,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomMultilineTextField(
                        placeholderText: 'Comment your order',
                        onChanged: (value) {
                          bloc.add(
                            TextFieldChanged(
                              comment: value,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Total cost: $totalCost \$',
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          text: 'Make Order',
                          height: 41,
                          width: 200,
                          onTap: (state.name.isNotEmpty &&
                                  state.address.isNotEmpty &&
                                  items.isNotEmpty)
                              ? () {
                                  bloc.add(
                                    CreateOrder(
                                      Order(
                                        price: totalCost,
                                        cafeName: cafeBloc.state.cafe.name,
                                        positions: items,
                                        address: state.address,
                                        userName: state.name,
                                        comment: state.comment,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
