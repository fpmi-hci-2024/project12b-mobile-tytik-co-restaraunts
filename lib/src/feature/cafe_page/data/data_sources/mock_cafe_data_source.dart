import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';
import 'package:monkey_delivery/src/feature/cafe_page/domain/data_sources/i_cafe_data_source.dart';

class MockCafeDataSource implements ICafeDataSource {
  @override
  Future<List<MenuPosition>> getMenuForCafe(String id) async {
    await Future.delayed(
      const Duration(milliseconds: 600),
    );
    final items = <MenuPosition>[
      const MenuPosition(
        id: '1',
        name: 'Margherita Pizza',
        cost: 3.5,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0274/9503/9079/files/20220211142754-margherita-9920_5a73220e-4a1a-4d33-b38f-26e98e3cd986.jpg?v=1723650067',
        ingredients: ['Tomato', 'Mozzarella', 'Basil', 'Olive Oil', 'Salt'],
        type: MenuPositionType.food,
      ),
      const MenuPosition(
        id: '2',
        name: 'Pepperoni Pizza',
        cost: 3.0,
        imageUrl:
            'https://www.simplyrecipes.com/thmb/KE6iMblr3R2Db6oE8HdyVsFSj2A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-1024x682-583b275444104ef189d693a64df625da.jpg',
        ingredients: ['Tomato Sauce', 'Mozzarella', 'Pepperoni', 'Oregano'],
        type: MenuPositionType.food,
      ),
      const MenuPosition(
        id: '3',
        name: 'Caesar Salad',
        cost: 5.5,
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
      const MenuPosition(
        id: '4',
        name: 'Cola',
        cost: 10.5,
        imageUrl:
            'https://aqomi.com/wp-content/uploads/2024/02/Coca_Cola_Case_Study_How_a_Failing_Brand_Revived_Its_Fortunes_with_a_Bold_New_Strategy_11.webp',
        type: MenuPositionType.drink,
      ),
      const MenuPosition(
        id: '5',
        name: 'Lemonade',
        cost: 0.5,
        imageUrl:
            'https://www.allrecipes.com/thmb/x-URJ7bHV2Yg3b_qPg126ynF_Bs=/0x512/filters:no_upscale():max_bytes(150000):strip_icc()/32385-best-lemonade-ever-DDMFS-4x3-8cef7761205e417499c89eb178e5ba2b.jpg',
        ingredients: ['Lemon Juice', 'Sugar', 'Water', 'Mint Leaves'],
        type: MenuPositionType.drink,
      ),
      const MenuPosition(
        id: '6',
        name: 'Iced Tea',
        cost: 5.0,
        imageUrl:
            'https://realfood.tesco.com/media/images/RFO-1400x919-IcedTea-8e156836-69f4-4433-8bae-c42e174212c1-0-1400x919.jpg',
        ingredients: ['Black Tea', 'Ice', 'Lemon', 'Sugar'],
        type: MenuPositionType.drink,
      ),
    ];

    return items;
  }
}
