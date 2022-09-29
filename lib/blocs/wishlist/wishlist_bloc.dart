import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()){
    on<LoadWishList>(_onLoadWishList);
    on<AddWishListProduct>(_onAddWishListProduct);
    on<RemoveWishListProduct>(_onRemoveWishListProduct);
  }

  void _onLoadWishList(event, Emitter<WishlistState> emit) async{
      emit(WishlistLoading());
      try{
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(WishlistLoaded());
      }catch(e){
        emit(WishlistError(error: e as Error));
    }
  }

  void _onAddWishListProduct(event, Emitter<WishlistState> emit){
      final state = this.state;
      if(state is WishlistLoaded){
        try{
          emit(WishlistLoaded(wishlist: Wishlist(products: List.from(state.wishlist.products)..add(event.product))));
        }catch(e){
          emit(WishlistError(error: e as Error));
        }
      }
  }

  void _onRemoveWishListProduct(event, Emitter<WishlistState> emit){
    final state = this.state;
    if(state is WishlistLoaded){
      try{
        emit(WishlistLoaded(wishlist: Wishlist(products: List.from(state.wishlist.products)..remove(event.product))));
      }catch(e){
        emit(WishlistError(error: e as Error));
      }
    }
  }
}
