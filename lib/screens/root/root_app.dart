import 'package:first_ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:first_ecommerce_app/config/config.dart';

class RootApp extends StatefulWidget {

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List tabItems = [
    {"icon": Icons.home, "size": 28.0},
    {"icon": Icons.apps_rounded, "size": 28.0},
    {"icon": Icons.favorite, "size": 28.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: [
          HomeScreen(),
          ProductScreen(),
          WishListScreen(),
        ],
      ),
      bottomNavigationBar: buildBottom(),
    );
  }

  Widget buildBottom() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      child: Padding(
        padding: AppTheme.paddingAll10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(tabItems.length, (index) =>
              IconButton(
                onPressed: () => setState(() => pageIndex = index),
                icon: Icon(
                  tabItems[index]['icon'], size: tabItems[index]['size'],
                  color: pageIndex == index ? Colors.blue : Colors.white,),
              )
          ),
        ),
      ),
    );
  }
}
