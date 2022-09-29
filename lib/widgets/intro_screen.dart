import 'package:flutter/material.dart';

class IntroductionSlide extends StatelessWidget {
  final String title;
  final String image;
  IntroductionSlide({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline2,),
          const SizedBox(height: 20,),
          Image.asset(image, fit: BoxFit.cover,),
        ],
      ),
    );
  }
}
