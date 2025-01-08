import 'package:monkey_delivery/src/core/domain/entities/cafe.dart';
import 'package:monkey_delivery/src/feature/home_page/domain/data_sources/i_all_cafes_data_source.dart';

import '../../../../core/domain/services/i_dio_service.dart';

class AllCafesDataSource implements IAllCafesDataSource {
  final IDioService _dioService;

  AllCafesDataSource(this._dioService);

  @override
  Future<List<Cafe>> findCafes(String query) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    return [
      Cafe(
        id: '01',
        logoUrl:
            'https://marketplace.canva.com/EAFTviDnQRM/1/0/1600w/canva-retro-and-vintage-coffee-shop-badge-logo-AkT-50lhy8M.jpg',
        name: '$query 1',
        rating: 4.8,
      ),
      Cafe(
        id: '02',
        logoUrl:
            'https://images.scalebranding.com/classic-cafe-symbol-logo-cc352ffe-2b2c-477c-a2ac-362029e3cc4c.jpg',
        name: '$query 2',
        rating: 3.6,
      ),
      Cafe(
        id: '03',
        logoUrl:
            'https://marketplace.canva.com/EAGEN1kgOec/1/0/1600w/canva-brown-beige-vintage-milk-tea-circle-logo-JLPnU4LfUg0.jpg',
        name: '$query 3',
        rating: 2.2,
      ),
    ];
  }

  @override
  Future<List<Cafe>> getAllCafes() async {
    final response = await _dioService
        .getRequest('restaurants?offset=0&limit=1000&order=ASC');
    print('::IK:: AllCafesDataSource.getAllCafes $response');

    final List<Cafe> result = [];

    for (var cafe in (response['result']['data']! as List<dynamic>)) {
      result.add(Cafe.fromJson(cafe));
    }

    return result;
  }

  @override
  Future<Cafe> getBestDaily() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    return const Cafe(
      id: '0',
      logoUrl: 'https://content.wepik.com/statics/68342939/preview-page0.jpg',
      name: 'Cafe 0',
      rating: 0.5,
    );
  }
}
