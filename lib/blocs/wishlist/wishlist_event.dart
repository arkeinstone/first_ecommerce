part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadWishList extends WishlistEvent{}

class AddWishListProduct extends WishlistEvent{
  final Product product;

  AddWishListProduct({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class RemoveWishListProduct extends WishlistEvent{
  final Product product;

  RemoveWishListProduct({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}