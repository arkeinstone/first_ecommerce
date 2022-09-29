import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/config/config.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool inCartScreen;
  CustomAppBar({required this.title, required this.inCartScreen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: AppTheme.paddingTop10,
        child: Container(
          color: Colors.black,
          padding: AppTheme.paddingHorizon20Vertical10,
          child: Text(title, style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),
        ),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: inCartScreen ? [] : [IconButton(
        onPressed: (){
          Navigator.pushNamed(context, '/cart');
        },
        icon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              if(state is LoadedCartState){
                int itemsCount = state.cart.productQuantity(state.cart.products).keys.length;
                return Badge(
                  showBadge: itemsCount > 0 ? true : false,
                  badgeContent: Text(itemsCount.toString(), style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                  child: const Icon(Icons.shopping_cart)
                );
              }else{
                return Container();
              }
            },
          ),
        ),
      )],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}