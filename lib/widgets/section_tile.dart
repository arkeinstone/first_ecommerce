import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/config/config.dart';

class SectionTile extends StatelessWidget {
  final String title;
  SectionTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.paddingHorizon20,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(title, style: Theme.of(context).textTheme.headline3,)
      ),
    );
  }
}