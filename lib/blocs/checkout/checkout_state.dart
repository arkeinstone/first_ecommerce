part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState extends Equatable {}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutLoaded extends CheckoutState {
  final String? name;
  final String? email;
  final String? address;
  final String? phone;
  final List<Product>? products;
  final String? subtotal;
  final String? shippingFee;
  final String? total;
  final Checkout checkout;

  CheckoutLoaded({
    this.name,
    this.email,
    this.address,
    this.phone,
    this.products,
    this.subtotal,
    this.shippingFee,
    this.total,}) : checkout = Checkout(
      name: name,
      email: email,
      address: address,
      phone: phone,
      products: products,
      subtotal: subtotal,
      shippingFee: shippingFee,
      total: total);

  @override
  List<Object?> get props => [name, email, address, phone, products, subtotal, shippingFee, total];
}

class CheckoutSuccess extends CheckoutState{
  final String docId;
  CheckoutSuccess({this.docId = ''});
  @override
  List<Object?> get props => [];
}

class CheckoutError extends CheckoutState {
  final Error? error;
  CheckoutError({this.error});
  @override
  List<Object?> get props => [error];
}
