import 'package:monkey_delivery/src/core/domain/entities/menu_position.dart';
import 'package:monkey_delivery/src/feature/cafe_page/domain/repositories/i_cafe_repository.dart';

import '../../domain/data_sources/i_cafe_data_source.dart';

class CafeRepository implements ICafeRepository {
  final ICafeDataSource _cafeDataSource;

  CafeRepository(this._cafeDataSource);

  @override
  Future<List<MenuPosition>> getMenuForCafe(String id) async {
    return await _cafeDataSource.getMenuForCafe(id);
  }
}
