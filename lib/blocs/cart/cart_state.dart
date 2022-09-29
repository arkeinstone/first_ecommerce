part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final Cart cart;
  LoadedCartState({this.cart = const Cart()});
  @override
  // TODO: implement props
  List<Object?> get props => [cart];
}

class ErrorCartState extends CartState {
  Error error;
  ErrorCartState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
