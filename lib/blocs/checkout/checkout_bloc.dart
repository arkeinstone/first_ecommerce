import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:first_ecommerce_app/repositories/repositories.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/models/models.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({required CartBloc cartBloc, required CheckoutRepository checkoutRepository}) :
       _cartBloc = cartBloc, _checkoutRepository = checkoutRepository, super(cartBloc.state is LoadedCartState ?
      CheckoutLoaded(
        products: (cartBloc.state as LoadedCartState).cart.products,
        subtotal: (cartBloc.state as LoadedCartState).cart.subtotalString,
        shippingFee: (cartBloc.state as LoadedCartState).cart.shippingFeeString,
        total: (cartBloc.state as LoadedCartState).cart.finalTotalString,
      ) : CheckoutLoading()){
    _cartSubscription = cartBloc.stream.listen((state){
      if(state is LoadedCartState){
        add(UpdateCheckout(cart: state.cart));
      }
    });

    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_confirmCheckout);
  }

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit){
    final state = this.state;
    if(state is CheckoutLoaded){
      emit(CheckoutLoaded(
        name: event.name ?? state.name,
        email: event.email ?? state.email,
        address: event.address ?? state.address,
        phone: event.phone ?? state.phone,
        products: event.cart?.products ?? state.products,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        shippingFee: event.cart?.shippingFeeString ?? state.shippingFee,
        total: event.cart?.finalTotalString ?? state.total,
      ));
    }
  }

  void _confirmCheckout(ConfirmCheckout event, Emitter<CheckoutState> emit) async{
    _checkoutSubscription?.cancel();
    if(state is CheckoutLoaded){
      try{
        String docId = await _checkoutRepository.addCheckout(event.checkout, event.docId);
        emit(CheckoutLoading());
        emit(CheckoutSuccess(docId: docId));
        emit(CheckoutLoaded());
      }catch(e){
        emit(CheckoutError(error: e as Error));
      }
    }
  }
}
