import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';
import 'package:monkey_delivery/src/core/domain/services/i_dio_service.dart';
import 'package:monkey_delivery/src/feature/cafe_page/domain/data_sources/i_cafe_data_source.dart';

class RemoteCafeDataSource implements ICafeDataSource {
  final IDioService _dioService;

  RemoteCafeDataSource(this._dioService);

  @override
  Future<List<MenuPosition>> getMenuForCafe(String id) async {
    final menu = await _dioService
        .getRequest('menus/get_menu_by_restaurant_id/?restaurant_id=$id');
    final dishes = await _dioService.getRequest(
      'dishes/get_dish_by_menu_id/?menu_id=${menu['result']['id']}',
    );
    final dish = dishes['result'];
    final position = MenuPosition(
      id: dish['id'],
      name: dish['name'],
      imageUrl: dish['logo_url'],
      cost: dish['price'],
      type: MenuPositionType.fromString(
        dish['dishes_type'],
      ),
      ingredients: _getIngredientsFromStr(
        dish['ingredients'],
      ),
    );
    return [
      position,
    ];
  }

  List<String> _getIngredientsFromStr(String str) {
    var result = <String>[];
    for (var ingredient in str.split('|')) {
      result.add(ingredient);
    }
    return result;
  }
}
