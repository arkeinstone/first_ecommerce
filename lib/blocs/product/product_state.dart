part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable{
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded({this.products = const <Product>[]});
  List<Object?> get props => [products];
}

