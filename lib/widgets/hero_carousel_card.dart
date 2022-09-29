import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/config/config.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category category;
  HeroCarouselCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        margin: AppTheme.paddingHorizon5Vertical30,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: CachedNetworkImage(
                imageUrl: category.imageUrl, fit: BoxFit.cover,
                width: 1000.0,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}