import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:first_ecommerce_app/config/config.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  ProductCarousel({required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: AppTheme.paddingHorizon20Vertical10,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index){
          return Padding(
              padding: AppTheme.paddingRight5,
              child: ProductCard(product: products[index],)
          );
        },
      ),
    );
  }
}