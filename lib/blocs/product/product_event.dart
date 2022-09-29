part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable{
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent{
  List<Object?> get props => [];
}

class UpdateProducts extends ProductEvent{
  final List<Product> products;
  UpdateProducts({required this.products});
  List<Object?> get props => [];
}