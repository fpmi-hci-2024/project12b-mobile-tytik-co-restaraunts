import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_delivery/src/core/domain/entities/order.dart';

import '../../../auth_page/domain/entities/user_information.dart';
import '../../../auth_page/domain/repositories/i_user_information_repository.dart';
import '../../../history_page/domain/repositories/i_history_repository.dart';

part 'cart_state.dart';

part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final IUserInformationRepository _userInformationRepository;
  final IHistoryRepository _historyRepository;

  CartBloc(
    this._userInformationRepository,
    this._historyRepository,
  ) : super(const CartState()) {
    on<LoadUserInformation>(_onLoadUserInformation);
    on<TextFieldChanged>(_onTextFieldChanged);
    on<CreateOrder>(_onCreateOrder);
  }

  Future<void> _onLoadUserInformation(
    LoadUserInformation event,
    Emitter<CartState> emit,
  ) async {
    if (!kIsWeb) {
      final info = await _userInformationRepository.getUserInformation();
      emit(
        state.copyWith(
          isLoaded: true,
          userInformation: info,
          name: info?.name,
          address: info?.address,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoaded: true,
        ),
      );
    }
  }

  Future<void> _onCreateOrder(
    CreateOrder event,
    Emitter<CartState> emit,
  ) async {
    await _historyRepository.addToHistory(event.order);
    emit(
      state.copyWith(
        orderSent: true,
      ),
    );
  }

  void _onTextFieldChanged(
    TextFieldChanged event,
    Emitter<CartState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.newName,
        address: event.newAddress,
        comment: event.comment,
      ),
    );
  }
}
