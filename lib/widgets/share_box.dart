import 'package:flutter/material.dart';

class ShareBox{
  List items = [
    {'image': 'assets/images/facebook_icon.png', 'title': 'Facebook'},
    {'image': 'assets/images/mess_icon.png', 'title': 'Messenger'},
    {'image': 'assets/images/insta_icon.png', 'title': 'Instagram'},
    {'image': 'assets/images/twitter_icon.png', 'title': 'Twitter'},
  ];

  void showShareBox(BuildContext context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: List.generate(items.length, (index) => ListTile(
              leading: Image.asset(items[index]['image'], width: 40, height: 40,),
              title: Text(items[index]['title']),
            )),
          ),
        );
      },
    );
  }
}