import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_ecommerce_app/utils/display_snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/config/config.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;
  final double height;
  ProductCard({required this.product, this.widthFactor = 2.5, this.leftPosition = 0, this.isWishList = false, this.height = 140});
  
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    final wishListBloc = BlocProvider.of<WishlistBloc>(context);
    String productTag = product.isRecommended ? 'assets/images/recommend-tag.png' : 'assets/images/new-tag.png';
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/detail', arguments: product),
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/widthFactor,
            height: height,
            child: ClipRRect(
              borderRadius: AppTheme.borderRadius8,
              // child: Image.network(product.imageUrl, fit: BoxFit.cover,)
              child: CachedNetworkImage(
                imageUrl: product.imageUrl, fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width/widthFactor - leftPosition,
              height: 70,
              decoration: BoxDecoration(color: Colors.black.withAlpha(120), borderRadius: AppTheme.borderRadius8),
              child: Padding(
                padding: AppTheme.paddingAll8,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                          const SizedBox(height: 2.0,),
                          Text(product.price > 0 ? '${product.price}\$' : 'Free', style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),),
                        ],),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: (){
                          cartBloc.add(AddCartProduct(product: product));
                          //context.read<CartBloc>().add(AddCartProduct(product: product));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Add to Cart successfully!', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                            backgroundColor: Colors.blue,
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ));
                        },
                        icon: const Icon(Icons.add_circle, color: Colors.white,),
                      ),
                    ),
                    isWishList ? Expanded(
                      child: IconButton(
                        onPressed: () => wishListBloc.add(RemoveWishListProduct(product: product)),
                        //onPressed: () => context.read<WishlistBloc>().add(RemoveWishListProduct(product: product)),
                        icon: const FaIcon(FontAwesomeIcons.trashAlt, color: Colors.white, size: 20,),
                      ),
                    ) : Container(),
                    isWishList ? Container() : Expanded(
                      child: BlocBuilder<WishlistBloc, WishlistState>(
                        builder: (context, state){
                          return IconButton(
                            onPressed: (){
                              if(state is WishlistLoaded){
                                if(state.wishlist.products.contains(product)){
                                  wishListBloc.add(RemoveWishListProduct(product: product));
                                  DisplaySnackBar.showSnackBar(context, 'Remove from WishList successfully!', Colors.blue);
                                }else{
                                  wishListBloc.add(AddWishListProduct(product: product));
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(productTag, width: 50, height: 50,)
          ),
        ],
      ),
    );
  }
}