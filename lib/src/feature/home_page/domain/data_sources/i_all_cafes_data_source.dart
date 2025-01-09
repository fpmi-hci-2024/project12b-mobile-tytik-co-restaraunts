import '../../../../core/domain/entities/cafe.dart';

abstract interface class IAllCafesDataSource {
  Future<List<Cafe>> getAllCafes();

  Future<List<Cafe>> findCafes(String query);

  Future<Cafe> getBestDaily();
}
