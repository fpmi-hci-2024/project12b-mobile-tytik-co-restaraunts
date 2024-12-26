import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/cafe.dart';
import '../../../../core/domain/entities/menu_position.dart';
import '../../domain/repositories/i_cafe_repository.dart';

part 'cafe_event.dart';

part 'cafe_state.dart';

class CafeBloc extends Bloc<CafeEvent, CafeState> {
  final ICafeRepository _cafeRepository;

  CafeBloc(this._cafeRepository) : super(const CafeState()) {
    on<InitCafeData>(_onInitCafeData);
    on<ChangePositionType>(_onChangePositionType);
    on<ChangeMenuPositionCount>(_onChangeMenuPositionCount);
  }

  Future<void> _onInitCafeData(
    InitCafeData event,
    Emitter<CafeState> emit,
  ) async {
    final menu = await _cafeRepository.getMenuForCafe(
      event.cafe.id,
    );
    emit(
      state.copyWith(
        cafe: event.cafe,
        menu: menu,
        dataLoaded: true,
      ),
    );
  }

  void _onChangePositionType(
    ChangePositionType event,
    Emitter<CafeState> emit,
  ) {
    emit(
      state.copyWith(selectedType: event.type),
    );
  }

  void _onChangeMenuPositionCount(
    ChangeMenuPositionCount event,
    Emitter<CafeState> emit,
  ) {
    emit(
      state.copyWith(
        menu: _changePositionCount(
          event.id,
          event.newCount,
        ),
      ),
    );
  }

  List<MenuPosition> _changePositionCount(String id, int newCount) {
    List<MenuPosition> updatedMenu = [];

    for (var position in state.menu) {
      if (position.id == id) {
        updatedMenu.add(
          position.copyWith(
            count: newCount,
          ),
        );
      } else {
        updatedMenu.add(position);
      }
    }
    return updatedMenu;
  }
}
