import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';

abstract class ICafeDataSource {
  Future<List<MenuPosition>> getMenuForCafe(String id);
}
