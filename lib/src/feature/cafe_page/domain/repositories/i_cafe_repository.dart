import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';

abstract interface class ICafeRepository {
  Future<List<MenuPosition>> getMenuForCafe(String id);
}
