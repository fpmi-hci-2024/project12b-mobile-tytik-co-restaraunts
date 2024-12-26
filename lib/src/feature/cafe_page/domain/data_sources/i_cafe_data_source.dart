import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';

abstract interface class ICafeDataSource {
  Future<List<MenuPosition>> getMenuForCafe(String id);
}
