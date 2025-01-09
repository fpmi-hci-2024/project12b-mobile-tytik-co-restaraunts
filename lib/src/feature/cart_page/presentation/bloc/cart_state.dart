part of 'cart_bloc.dart';

class CartState {
  final UserInformation userInformation;
  final String name;
  final String address;
  final String comment;
  final bool isLoaded;
  final bool orderSent;

  const CartState({
    this.userInformation = const UserInformation.empty(),
    this.name = '',
    this.address = '',
    this.comment = '',
    this.isLoaded = false,
    this.orderSent = false,
  });

  CartState copyWith({
    UserInformation? userInformation,
    String? name,
    String? address,
    String? comment,
    bool? isLoaded,
    bool? orderSent,
  }) {
    return CartState(
      userInformation: userInformation ?? this.userInformation,
      name: name ?? this.name,
      address: address ?? this.address,
      isLoaded: isLoaded ?? this.isLoaded,
      comment: comment ?? this.comment,
      orderSent: orderSent ?? this.orderSent,
    );
  }
}
