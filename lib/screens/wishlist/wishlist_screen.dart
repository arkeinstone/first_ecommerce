import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/config/config.dart';

class WishListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist Screen', inCartScreen: false),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state){
          if(state is WishlistLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is WishlistLoaded){
            return state.wishlist.products.isNotEmpty ? GridView.builder(
              padding: AppTheme.paddingHorizon8Vertical16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 2.2),
              itemCount: state.wishlist.products.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: ProductCard(
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      leftPosition: 100,
                      isWishList: true,
                      height: 200,
                    )
                  )
                );
              },
            ) : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Wishlist Is Empty', style: Theme.of(context).textTheme.headline2,),
                  const SizedBox(height: 10,),
                  Image.asset('assets/images/empty-fridge.png', fit: BoxFit.cover, height: 240,),
                ],
              ),
            );
          }else if(state is WishlistError){
            return Center(child: Text(state.error.toString()),);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}