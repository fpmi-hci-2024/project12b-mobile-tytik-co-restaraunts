import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/widgets/custom_scaffold.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Text('AAAAAA'),
      ),
    );
  }
}
