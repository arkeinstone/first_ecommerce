import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/config/config.dart';

class OrderSummary extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state){
          if(state is LoadingCartState){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is LoadedCartState){
            return Column(
              children: [
                const Divider(thickness: 2, color: Colors.grey,),
                Padding(
                  padding: AppTheme.paddingHorizon40Vertical10,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SUBTOTAL', style: Theme.of(context).textTheme.headline5,),
                          Text('${state.cart.subtotalString}\$', style: Theme.of(context).textTheme.headline5,),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping Fee', style: Theme.of(context).textTheme.headline5,),
                          Text('${state.cart.shippingFeeString}\$', style: Theme.of(context).textTheme.headline5,),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: AppTheme.paddingAll5,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: AppTheme.paddingHorizon20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                            Text('${state.cart.finalTotalString}\$', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
