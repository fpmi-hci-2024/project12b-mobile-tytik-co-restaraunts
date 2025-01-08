import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_delivery/src/core/widgets/custom_button.dart';
import 'package:monkey_delivery/src/core/widgets/custom_scaffold.dart';
import 'package:monkey_delivery/src/core/widgets/menu_position_card.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/domain/entities/menu_position.dart';
import '../../../core/domain/entities/order.dart';
import '../../../core/widgets/cutom_app_bar_wrapper.dart';
import '../../../locator/locator.dart';
import '../../cafe_page/presentation/config/cafe_page_theme.dart';
import 'bloc/history_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();

    return CustomScaffold(
      appBar: CustomAppBarWrapper(
        titleText: theme.appName,
        height: 50,
        addGoBackButton: true,
        webContentWidth: 660,
      ),
      body: SafeArea(
        child: BlocProvider<HistoryBloc>(
          create: (_) => locator<HistoryBloc>()
            ..add(
              const InitHistoryPage(),
            ),
          child: Builder(builder: (context) {
            return BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
              if (!state.isLoaded) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryBorderColor,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Orders History',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) => CustomButton(
                        text:
                            '${_getDate(state.orders[index].creationDateTime)} Cafe ${state.orders[index].cafeName}',
                        onTap: () => _showBottomSheet(
                          context,
                          state.orders[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    ),
                  ],
                ),
              );
            });
          }),
        ),
      ),
    );
  }

  Future<void> _showBottomSheet(
    BuildContext context,
    Order order,
  ) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (bottomSheetContext) {
        final theme = locator<CafeTheme>();
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          decoration: BoxDecoration(
            color: theme.bottomSheetColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      order.cafeName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _buildInfoRow("Date", _getDate(order.creationDateTime)),
                  const SizedBox(height: 16.0),
                  _buildInfoRow("Address", order.address),
                  const SizedBox(height: 16.0),
                  _buildInfoRow("Client name", order.userName),
                  const SizedBox(height: 16.0),
                  if (order.comment != null && order.comment!.isNotEmpty) ...[
                    _buildInfoRow("Comment", order.comment!),
                    const SizedBox(height: 16.0),
                  ],
                  _buildInfoRow(
                      "Full price", "${order.price.toStringAsFixed(2)} \$"),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Positions:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: order.positions.length,
                    itemBuilder: (context, index) {
                      final position = order.positions[index];
                      return _buildPositionCard(position);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildPositionCard(MenuPosition position) {
    return MenuPositionCard(
      showFullPrice: true,
      menuPosition: position,
      onCountChanged: (_) {},
      showButtons: false,
    );
  }

  String _getDate(DateTime time) {
    return '${time.day.toString()}.${time.month.toString()}.${time.year.toString()} ${time.hour.toString()}:${time.minute.toString()}';
  }
}
