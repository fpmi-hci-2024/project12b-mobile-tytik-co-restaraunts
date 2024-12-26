import 'package:monkey_delivery/src/core/domain/entities/cafe.dart';
import 'package:monkey_delivery/src/feature/home_page/domain/data_sources/i_all_cafes_data_source.dart';
import 'package:monkey_delivery/src/feature/home_page/domain/repositories/i_all_cafes_repository.dart';

class AllCafesRepository implements IAllCafesRepository {
  final IAllCafesDataSource _allCafesDataSource;

  const AllCafesRepository(this._allCafesDataSource);

  @override
  Future<List<Cafe>> findCafes(String query) async {
    return await _allCafesDataSource.findCafes(query);
  }

  @override
  Future<List<Cafe>> getAllCafes() async {
    return await _allCafesDataSource.getAllCafes();
  }

  @override
  Future<Cafe> getBestDaily() async {
    return await _allCafesDataSource.getBestDaily();
  }
}
