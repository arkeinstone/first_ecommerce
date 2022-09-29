import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/config/config.dart';

class CustomDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: AppTheme.borderRadius5,
            side: AppTheme.blackBorderSide,
          ),
          child: ExpansionTile(
            title: Text('Product Information', style: Theme.of(context).textTheme.headline3,),
            initiallyExpanded: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text('“Triple-A” or “AAA” is not a formal classification of games by any means. The terms generally refer to games that boast a large budget for both production and marketing. Due to that, they are expected to be of high quality and sell in a substantial number of copies, typically going into millions. AAA is the gaming industry’s equivalent of the word “blockbuster” that is used for the same category of products in the movie business.',
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey[800]),),
                ),
              )
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: AppTheme.borderRadius5,
            side: AppTheme.blackBorderSide,
          ),
          child: ExpansionTile(
            title: Text('Delivery Information', style: Theme.of(context).textTheme.headline3,),
            children: [
              ListTile(
                leading: const Icon(Icons.check, color: Colors.green,),
                title: Text('Cash',
                  style: Theme.of(context).textTheme.headline6!,),
              ),
              ListTile(
                leading: const Icon(Icons.check, color: Colors.green,),
                title: Text('Credit Cards',
                  style: Theme.of(context).textTheme.headline6!,),
              ),
              ListTile(
                leading: const Icon(Icons.check, color: Colors.green,),
                title: Text('Bank Transfer',
                  style: Theme.of(context).textTheme.headline6!,),
              ),
              ListTile(
                leading: const Icon(Icons.check, color: Colors.green,),
                title: Text('Mobile Payments',
                  style: Theme.of(context).textTheme.headline6!,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
