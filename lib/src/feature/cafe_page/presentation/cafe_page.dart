import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';
import 'package:monkey_delivery/src/core/widgets/custom_button.dart';
import 'package:monkey_delivery/src/core/widgets/custom_switch.dart';
import 'package:monkey_delivery/src/core/widgets/image_with_border.dart';
import 'package:monkey_delivery/src/core/widgets/menu_position_card.dart';

import '../../../core/domain/entities/cafe.dart';
import '../../../core/widgets/big_cafe_card.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/cutom_app_bar_wrapper.dart';
import '../../../locator/locator.dart';
import 'config/cafe_page_theme.dart';

@RoutePage()
class CafePage extends StatelessWidget {
  const CafePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<CafeTheme>();
    final items = <MenuPosition>[
      MenuPosition(
        name: 'Margherita Pizza',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0274/9503/9079/files/20220211142754-margherita-9920_5a73220e-4a1a-4d33-b38f-26e98e3cd986.jpg?v=1723650067',
        ingredients: ['Tomato', 'Mozzarella', 'Basil', 'Olive Oil', 'Salt'],
        type: MenuPositionType.food,
      ),
      MenuPosition(
        name: 'Pepperoni Pizza',
        imageUrl:
            'https://www.simplyrecipes.com/thmb/KE6iMblr3R2Db6oE8HdyVsFSj2A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-1024x682-583b275444104ef189d693a64df625da.jpg',
        ingredients: ['Tomato Sauce', 'Mozzarella', 'Pepperoni', 'Oregano'],
        type: MenuPositionType.food,
      ),
      MenuPosition(
        name: 'Caesar Salad',
        imageUrl:
            'https://www.allrecipes.com/thmb/mXZ0Tulwn3x9_YB_ZbkiTveDYFE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/229063-Classic-Restaurant-Caesar-Salad-ddmfs-4x3-231-89bafa5e54dd4a8c933cf2a5f9f12a6f.jpg',
        ingredients: [
          'Romaine Lettuce',
          'Caesar Dressing',
          'Croutons',
          'Parmesan Cheese',
          'Black Pepper',
        ],
        type: MenuPositionType.food,
      ),
      MenuPosition(
        name: 'Cola',
        imageUrl:
            'https://aqomi.com/wp-content/uploads/2024/02/Coca_Cola_Case_Study_How_a_Failing_Brand_Revived_Its_Fortunes_with_a_Bold_New_Strategy_11.webp',
        type: MenuPositionType.drink,
      ),
      MenuPosition(
        name: 'Lemonade',
        imageUrl:
            'https://www.allrecipes.com/thmb/x-URJ7bHV2Yg3b_qPg126ynF_Bs=/0x512/filters:no_upscale():max_bytes(150000):strip_icc()/32385-best-lemonade-ever-DDMFS-4x3-8cef7761205e417499c89eb178e5ba2b.jpg',
        ingredients: ['Lemon Juice', 'Sugar', 'Water', 'Mint Leaves'],
        type: MenuPositionType.drink,
      ),
      MenuPosition(
        name: 'Iced Tea',
        imageUrl:
            'https://realfood.tesco.com/media/images/RFO-1400x919-IcedTea-8e156836-69f4-4433-8bae-c42e174212c1-0-1400x919.jpg',
        ingredients: ['Black Tea', 'Ice', 'Lemon', 'Sugar'],
        type: MenuPositionType.drink,
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
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) => MenuPositionCard(
                        menuPosition: items[index],
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
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: BigCafeCard(
                      cafe: Cafe(
                        id: '1',
                        name: 'Cafe 1',
                        rating: 5.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: CustomSwitch(
                    leftName: 'Food',
                    rightName: 'Drinks',
                    onTap: (_) {},
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
                      menuPosition: items[index],
                      onTap: () async => await _showBottomSheet(
                        context,
                        items[index],
                      ),
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

  Future<void> _showBottomSheet(
      BuildContext context, MenuPosition position) async {
    final theme = locator<CafeTheme>();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
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
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    position.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: ImageWithBorder(
                      url: position.imageUrl,
                      width: 250,
                      height: 166.7,
                    ),
                  ),
                  if (position.ingredients != null) ...[
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
                    _BulletList(items: position.ingredients ?? []),
                  ],
                  const SizedBox(height: 16.0),
                  CustomButton(
                    text: 'Add To Cart',
                    width: 200,
                    height: 41,
                  ),
                ],
              ),
            ),
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
