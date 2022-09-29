import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_ecommerce_app/utils/display_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/config/config.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: CustomAppBar(title: product.name, inCartScreen: false),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => ShareBox().showShareBox(context),
                icon: const Icon(Icons.share, color: Colors.white,),
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state){
                  return IconButton(
                    onPressed: (){
                      if(state is WishlistLoaded){
                        if(state.wishlist.products.contains(product)){
                          context.read<WishlistBloc>().add(RemoveWishListProduct(product: product));
                          DisplaySnackBar.showSnackBar(context, 'Remove from wishList successfully!', Colors.blue);
                        }else{
                          context.read<WishlistBloc>().add(AddWishListProduct(product: product));
                          DisplaySnackBar.showSnackBar(context, 'Add to wishList successfully!', Colors.green);
                        }
                      }
                    },
                    icon: BlocBuilder<WishlistBloc, WishlistState>(
                      builder: (context, state){
                        if(state is WishlistLoaded){
                          if(state.wishlist.products.contains(product)){
                            return const Icon(Icons.favorite, color: Colors.red,);
                          }else{
                            return const Icon(Icons.favorite, color: Colors.white,);
                          }
                        }else{
                          return Container();
                        }
                      },
                    )
                  );
                },
              ),
              IconButton(
                onPressed: (){
                  cartBloc.add(AddCartProduct(product: product));
                  DisplaySnackBar.showSnackBar(context, 'Add to Cart successfully!', Colors.blue);
                },
                icon: const Icon(Icons.add_circle, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: AppTheme.paddingHorizon20Vertical10,
            child: ClipRRect(
              borderRadius: AppTheme.borderRadius12,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl, fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              )
            ),
          ),
          Padding(
            padding: AppTheme.paddingHorizon20Vertical10,
            child: Stack(
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: AppTheme.paddingAll5,
                  height: 50,
                  width: MediaQuery.of(context).size.width - 10,
                  color: Colors.black,
                  child: Padding(
                    padding: AppTheme.paddingHorizon20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                        Text(product.price > 0 ? '${product.price}\$' : 'Free', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomDetail(),
        ],
      ),
    );
  }
}