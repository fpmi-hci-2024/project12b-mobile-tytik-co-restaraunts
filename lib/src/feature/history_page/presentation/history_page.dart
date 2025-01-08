import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/widgets/custom_button.dart';
import 'package:monkey_delivery/src/core/widgets/custom_scaffold.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/widgets/cutom_app_bar_wrapper.dart';
import '../../../locator/locator.dart';
import '../../cafe_page/presentation/config/cafe_page_theme.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();

    final List<String> orders = [
      'Order 1',
      'Order 2',
    ];
    return CustomScaffold(
      appBar: CustomAppBarWrapper(
        titleText: theme.appName,
        height: 50,
        addGoBackButton: true,
        webContentWidth: 660,
      ),
      body: SafeArea(
        child: Padding(
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
                itemCount: orders.length,
                itemBuilder: (context, index) => CustomButton(
                  text: orders[index],
                  onTap: () => _showBottomSheet(
                    context,
                    orders[index],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showBottomSheet(
    BuildContext context,
    String text,
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
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.bottomSheetColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
