part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class LoadUserInformation extends CartEvent {
  const LoadUserInformation();
}

class TextFieldChanged extends CartEvent {
  final String? newName;
  final String? newAddress;
  final String? comment;

  const TextFieldChanged({
    this.newName,
    this.newAddress,
    this.comment,
  });
}

class CreateOrder extends CartEvent {
  const CreateOrder();
}
