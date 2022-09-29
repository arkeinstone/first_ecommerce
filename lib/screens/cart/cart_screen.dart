import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/config/config.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map productMap = {};
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: 'Cart Screen', inCartScreen: true),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 50,
          child: Center(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state){
                if(state is LoadedCartState){
                  if(state.cart.products.isNotEmpty){
                    return ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/checkout');
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: Text('GO TO CHECKOUT', style: Theme.of(context).textTheme.headline3),
                    );
                  }else{
                    return Container();
                  }
                }else{
                  return Container();
                }
              },
            ),
          )
        ),
      ),
      body: Padding(
        padding: AppTheme.paddingHorizon20Vertical10,
        child: SingleChildScrollView(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              if(state is LoadingCartState){
                return const Center(child: CircularProgressIndicator(),);
              }else if(state is LoadedCartState){
                productMap = state.cart.productQuantity(state.cart.products);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.cart.freeShippingString, style: Theme.of(context).textTheme.headline5,),
                            ElevatedButton(
                              onPressed: (){
                                context.read<CartBloc>().add(RemoveAllCartProducts(products: state.cart.products));
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.black, elevation: 0),
                              child: Text('Remove Cart', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 400,
                          child: productMap.isEmpty ?
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Your Cart Is Empty', style: Theme.of(context).textTheme.headline2,),
                                const SizedBox(height: 10,),
                                Image.asset('assets/images/empty-fridge.png', fit: BoxFit.cover, height: 240,),
                              ],
                            ),
                          ) : ListView.builder(
                            itemCount: productMap.length,
                            itemBuilder: (context, index){
                              return CartProductCard(
                                product: productMap.keys.elementAt(index),
                                quantity: productMap.values.elementAt(index),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    OrderSummary(),
                  ],
                );
              }else if(state is ErrorCartState){
                return Center(child: Text(state.error.toString()),);
              }else{
                return Container();
              }
            },

          ),
        ),
      ),
    );
  }
}


