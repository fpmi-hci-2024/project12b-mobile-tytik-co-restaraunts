import 'package:monkey_delivery/src/core/domain/entities/cafe.dart';
import 'package:monkey_delivery/src/feature/home_page/domain/data_sources/i_all_cafes_data_source.dart';

import '../../../../core/domain/services/i_dio_service.dart';

class AllCafesDataSource implements IAllCafesDataSource {
  final IDioService _dioService;

  AllCafesDataSource(this._dioService);

  @override
  Future<List<Cafe>> findCafes(String query) async {
    final cafes = await getAllCafes();
    return cafes.where((element) => element.name.contains(query)).toList();
  }

  @override
  Future<List<Cafe>> getAllCafes() async {
    final response = await _dioService
        .getRequest('restaurants?offset=0&limit=1000&order=ASC');

    final List<Cafe> result = [];

    for (var cafe in (response['result']['data']! as List<dynamic>)) {
      result.add(Cafe.fromJson(cafe));
    }

    return result;
  }

  @override
  Future<Cafe> getBestDaily() async {
    final cafes = await getAllCafes();

    return cafes.firstWhere((element) => (element.rating ?? 0) > 4);
  }
}
