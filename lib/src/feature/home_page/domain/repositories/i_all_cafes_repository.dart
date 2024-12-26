import '../../../../core/domain/entities/cafe.dart';

abstract class IAllCafesRepository {
  Future<List<Cafe>> getAllCafes();

  Future<List<Cafe>> findCafes(String query);

  Future<Cafe> getBestDaily();
}
