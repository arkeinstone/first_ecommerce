part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadCart extends CartEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCartProduct extends CartEvent{
  final Product product;
  AddCartProduct({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class RemoveCartProduct extends CartEvent{
  final Product product;
  RemoveCartProduct({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class DeleteCartProduct extends CartEvent{
  final Product product;
  DeleteCartProduct({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class RemoveAllCartProducts extends CartEvent{
  final List<Product> products;
  RemoveAllCartProducts({required this.products});
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
