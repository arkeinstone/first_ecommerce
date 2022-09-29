import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/config/config.dart';

class OrderProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  OrderProductCard({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.paddingBottom8,
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
                Text(product.name.length > 15 ? '${product.name.substring(0,16)}...' : product.name, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline5,),
                const SizedBox(height: 4.0,),
                Text('Quantity: $quantity', style: Theme.of(context).textTheme.headline6,),
              ],
            ),
          ),
          Text('${product.price.toStringAsFixed(2)}\$', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline5,),
        ],
      ),
    );
  }
}
