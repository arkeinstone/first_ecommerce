import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:first_ecommerce_app/config/config.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  CartProductCard({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.paddingBottom8,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state){
          if(state is LoadingCartState){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is LoadedCartState){
            return ClipRRect(
              borderRadius: AppTheme.borderRadius5,
              child: Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) => context.read<CartBloc>().add(DeleteCartProduct(product: product)),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                      autoClose: true,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: AppTheme.borderRadius5,
                        child: CachedNetworkImage(imageUrl: product.imageUrl, width: 100, height: 80, fit: BoxFit.cover,)
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: Theme.of(context).textTheme.headline5,),
                          SizedBox(height: 4.0,),
                          Text('${product.price}\$', style: Theme.of(context).textTheme.headline6,),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => context.read<CartBloc>().add(RemoveCartProduct(product: product)),
                          icon: const Icon(Icons.remove_circle),
                        ),
                        Text('$quantity', style: Theme.of(context).textTheme.headline5,),
                        IconButton(
                          onPressed: () => context.read<CartBloc>().add(AddCartProduct(product: product)),
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}