import 'package:flutter/material.dart';

class DisplaySnackBar{
  static void showSnackBar(BuildContext context, String title, Color color){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ));
  }
}