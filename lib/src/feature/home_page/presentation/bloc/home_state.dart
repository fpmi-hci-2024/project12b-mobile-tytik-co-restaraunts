part of 'home_bloc.dart';

class HomeState {
  final Cafe bestDaily;
  final List<Cafe> allCafes;
  final String query;
  final List<Cafe> searchResultCafes;
  final bool showSearchResults;
  final bool pageLoaded;

  const HomeState({
    this.bestDaily = const Cafe.empty(),
    this.allCafes = const [],
    this.query = '',
    this.searchResultCafes = const [],
    this.showSearchResults = false,
    this.pageLoaded = false,
  });

  HomeState copyWith({
    Cafe? bestDaily,
    List<Cafe>? allCafes,
    String? query,
    List<Cafe>? searchResultCafes,
    bool? showSearchResults,
    bool? pageLoaded,
  }) {
    return HomeState(
      bestDaily: bestDaily ?? this.bestDaily,
      allCafes: allCafes ?? this.allCafes,
      query: query ?? this.query,
      searchResultCafes: searchResultCafes ?? this.searchResultCafes,
      showSearchResults: showSearchResults ?? this.showSearchResults,
      pageLoaded: pageLoaded ?? this.pageLoaded,
    );
  }
}
