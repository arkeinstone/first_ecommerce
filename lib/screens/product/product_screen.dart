import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/config/config.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'Product Screen', inCartScreen: false),
      body: Padding(
        padding: AppTheme.paddingVertical5,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state){
            if(state is ProductLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is ProductLoaded){
              return GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: AppTheme.paddingHorizon8Vertical10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.15),
                itemCount: state.products.length,
                itemBuilder: (context, index){
                  return Center(child: ProductCard(product: state.products[index], widthFactor: 2.2,));
                },
              );
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}