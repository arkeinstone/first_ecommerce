part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent{
  final String? name;
  final String? email;
  final String? address;
  final String? phone;
  final Cart? cart;
  UpdateCheckout({this.name, this.email, this.address, this.phone, this.cart});

  @override
  List<Object?> get props => [name, email, address, phone, cart];
}

class ConfirmCheckout extends CheckoutEvent{
  final Checkout checkout;
  final String docId;
  ConfirmCheckout({required this.checkout, required this.docId});

  @override
  List<Object?> get props => [checkout];
}
