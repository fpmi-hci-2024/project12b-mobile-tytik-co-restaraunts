import 'package:monkey_delivery/src/core/domain/entities/cafe.dart';
import 'package:monkey_delivery/src/feature/home_page/domain/data_sources/i_all_cafes_data_source.dart';

class MockAllCafesDataSource implements IAllCafesDataSource {
  @override
  Future<List<Cafe>> findCafes(String query) async {
    // TODO: implement findCafes
    throw UnimplementedError();
  }

  @override
  Future<List<Cafe>> getAllCafes() async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    );
    final items = <Cafe>[
      const Cafe(
        id: '1',
        logoUrl:
            'https://marketplace.canva.com/EAGFSM3oG94/1/0/1600w/canva-brown-flat-illustrative-cafe-coffee-logo-NxP8Z1KE9MM.jpg',
        name: 'Canva Brown',
        rating: 5.0,
      ),
      const Cafe(
        id: '2',
        logoUrl:
            'https://www.shutterstock.com/image-vector/coffee-cup-icon-tea-logo-600nw-2478306581.jpg',
        name: 'Coffee Cup',
        rating: 4.0,
      ),
      const Cafe(
        id: '3',
        logoUrl:
            'https://img.freepik.com/premium-photo/coffee-shop-logo-ai_849715-15207.jpg',
        name: 'Coffee Shop',
        rating: 3.2,
      ),
      const Cafe(
        id: '4',
        logoUrl:
            'https://www.advoice.co.in/wp-content/uploads/2023/11/Cafe-Logo.jpg',
        name: 'Super Cafe',
        rating: 3.5,
      ),
      const Cafe(
        id: '5',
        logoUrl: 'https://cdn.3axis.co/user-images/eo2gkl18.png',
        name: 'Idk How to Name',
        rating: 3.6,
      ),
      const Cafe(
        id: '6',
        logoUrl:
            'https://t4.ftcdn.net/jpg/02/28/17/91/360_F_228179191_n3vmOtHDr7e8JfKf3qXFgdPso0w8ntRQ.jpg',
        name: 'Another Boring Cafe',
        rating: 3.3,
      ),
      const Cafe(
        id: '7',
        logoUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTZZ1DiNOJqTs-dRCmLlxUm4o1_uphmJnFYg&s',
        name: 'Best Cafe',
        rating: 0.5,
      ),
    ];
    return items;
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
