part of 'new_sign_in_bloc.dart';

abstract class NewSignInEvent {
  const NewSignInEvent();
}

class LoadUserInformation extends NewSignInEvent {
  const LoadUserInformation();
}

class TextFieldChanged extends NewSignInEvent {
  final String? newName;
  final String? newAddress;

  const TextFieldChanged({
    this.newName,
    this.newAddress,
  });
}

class SaveNewInfo extends NewSignInEvent {
  const SaveNewInfo();
}
