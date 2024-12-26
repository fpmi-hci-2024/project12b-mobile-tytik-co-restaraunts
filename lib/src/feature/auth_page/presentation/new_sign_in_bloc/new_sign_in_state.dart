part of 'new_sign_in_bloc.dart';

class NewSignInState {
  final UserInformation userInformation;
  final String name;
  final String address;
  final bool isLoaded;

  const NewSignInState({
    this.userInformation = const UserInformation.empty(),
    this.name = '',
    this.address = '',
    this.isLoaded = false,
  });

  NewSignInState copyWith({
    UserInformation? userInformation,
    String? name,
    String? address,
    bool? isLoaded,
  }) {
    return NewSignInState(
      userInformation: userInformation ?? this.userInformation,
      name: name ?? this.name,
      address: address ?? this.address,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
