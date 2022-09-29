import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/config/config.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String documentId;
  OrderConfirmationScreen({required this.documentId});

  @override
  Widget build(BuildContext context) {
    Map productMap;
    return Scaffold(
      appBar: CustomAppBar(title: 'Order Confirmation', inCartScreen: true),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 50,
          child: Center(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state){
                if(state is LoadedCartState){
                  return ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/');
                      context.read<CartBloc>().add(RemoveAllCartProducts(products: state.cart.products));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text('BACK TO HOMEPAGE', style: Theme.of(context).textTheme.headline3),
                  );
                }else{
                  return Container();
                }
              },
            )
          )
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            child: Padding(
              padding: AppTheme.paddingTop100Bottom10,
              child: Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/shipping-icon.png', fit: BoxFit.cover, width: 150,),
                    const SizedBox(height: 10,),
                    Text('Your Order Is Completed', style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
                    const SizedBox(height: 10,),
                    Text('Order ID: $documentId', style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              if(state is LoadedCartState){
                productMap = state.cart.productQuantity(state.cart.products);
                return Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: productMap.keys.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: AppTheme.paddingFromL20T10R20B0,
                        child: OrderProductCard(
                          product: productMap.keys.elementAt(index),
                          quantity: productMap.values.elementAt(index),
                        ),
                      );
                    },
                  ),
                );
              }else{
                return Container();
              }
            },
          ),
          Padding(
            padding: AppTheme.paddingHorizon40Vertical10,
            child: OrderSummary()
          ),
        ],
      ),
    );
  }
}
