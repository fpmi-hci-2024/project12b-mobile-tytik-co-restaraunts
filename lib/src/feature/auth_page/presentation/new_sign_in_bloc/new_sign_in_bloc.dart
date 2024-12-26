import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_delivery/src/feature/auth_page/domain/entities/user_information.dart';

import '../../domain/repositories/i_user_information_repository.dart';

part 'new_sign_in_event.dart';

part 'new_sign_in_state.dart';

class NewSignInBloc extends Bloc<NewSignInEvent, NewSignInState> {
  final IUserInformationRepository _userInformationRepository;

  NewSignInBloc(
    this._userInformationRepository,
  ) : super(const NewSignInState()) {
    on<LoadUserInformation>(_onLoadUserInformation);
    on<TextFieldChanged>(_onTextFieldChanged);
    on<SaveNewInfo>(_onSaveNewInfo);
  }

  Future<void> _onLoadUserInformation(
    LoadUserInformation event,
    Emitter<NewSignInState> emit,
  ) async {
    final info = await _userInformationRepository.getUserInformation();
    emit(
      state.copyWith(
        isLoaded: true,
        userInformation: info,
        name: info?.name,
        address: info?.address,
      ),
    );
  }

  void _onTextFieldChanged(
    TextFieldChanged event,
    Emitter<NewSignInState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.newName,
        address: event.newAddress,
      ),
    );
  }

  void _onSaveNewInfo(
    SaveNewInfo event,
    Emitter<NewSignInState> emit,
  ) {
    _userInformationRepository.saveUserInformation(
      UserInformation(
        name: state.name,
        address: state.address,
      ),
    );
  }
}
