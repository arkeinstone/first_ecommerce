import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(LoadingCartState()) {
    on<LoadCart>(_onLoadCart);
    on<AddCartProduct>(_onAddCartProduct);
    on<RemoveCartProduct>(_onRemoveCartProduct);
    on<RemoveAllCartProducts>(_onRemoveAllCartProducts);
    on<DeleteCartProduct>(_onDeleteCartProduct);
  }

  void _onLoadCart(event, Emitter<CartState> emit) async{
    emit(LoadingCartState());
    try{
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(LoadedCartState());
    }catch(e){
      emit(ErrorCartState(error: e as Error));
    }
  }

  void _onAddCartProduct(event, Emitter<CartState> emit){
    final state = this.state;
    if(state is LoadedCartState){
      try{
        emit(LoadedCartState(cart: Cart(products: List.from(state.cart.products)..add(event.product))));
      }catch(e){
        emit(ErrorCartState(error: e as Error));
      }
    }
  }

  void _onRemoveCartProduct(event, Emitter<CartState> emit){
    final state = this.state;
    if(state is LoadedCartState){
      try{
        emit(LoadedCartState(cart: Cart(products: List.from(state.cart.products)..remove(event.product))));
      }catch(e){
        emit(ErrorCartState(error: e as Error));
      }
    }
  }

  void _onRemoveAllCartProducts(event, Emitter<CartState> emit){
    final state = this.state;
    if(state is LoadedCartState){
      try{
        emit(LoadedCartState(cart: Cart(products: List.from(state.cart.products)..clear())));
      }catch(e){
        emit(ErrorCartState(error: e as Error));
      }
    }
  }

  void _onDeleteCartProduct(DeleteCartProduct event, Emitter<CartState> emit){
    final state = this.state;
    if(state is LoadedCartState){
      try{
        emit(LoadedCartState(cart: Cart(products: List.from(state.cart.products)..removeWhere((prod) => prod.name == event.product.name))));
      }catch(e){
        emit(ErrorCartState(error: e as Error));
      }
    }
  }
}
