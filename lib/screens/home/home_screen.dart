import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'E3 Gaming Store', inCartScreen: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel Card
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state){
                if(state is CategoryLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is CategoryLoaded){
                  return CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      aspectRatio: 1.6,
                      enlargeCenterPage: true,
                    ),
                    items: state.categories.map((category) => HeroCarouselCard(category: category)).toList(),
                  );
                }else{
                  return Container();
                }
              },
            ),
            // Section Title
            SectionTile(title: 'RECOMMENDED'),
            // Product Carousel
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state){
                if(state is ProductLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is ProductLoaded){
                  return ProductCarousel(products: state.products.where((product) => product.isRecommended).toList(),);
                }else{
                  return Container();
                }
              },
            ),
            // Section Title
            SectionTile(title: 'POPULAR'),
            // Product Carousel
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state){
                if(state is ProductLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is ProductLoaded){
                  return ProductCarousel(products: state.products.where((product) => product.isPopular).toList(),);
                }else{
                  return Container();
                }
              },
            ),
          ],

        ),
      ),
    );
  }
}





